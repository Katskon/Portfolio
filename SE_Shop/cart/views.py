from django.shortcuts import render,redirect

from django.http import HttpResponseRedirect

from cart import models

from product.models import Product

from login.models import Member

from django.utils.html import format_html #用來格式化html

#嵌入ECPay 的SDK

import os
basedir = os.path.dirname(__file__) #抓取預設目錄位置
file = os.path.join(basedir,'ecpay_payment_sdk.py')

import importlib.util

spec = importlib.util.spec_from_file_location(
    "ecpay_payment_sdk",
    file
)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

from datetime import datetime



cartlist = list() #購物車內容
customname = "" #客戶姓名
customphone = "" #客戶電話
customaddress = "" #客戶地址
customemail = "" #客戶信箱

orderTotal = 0#消費總額
goodsTitle = list() #存放進購物車的商品名稱


#加入購物車中 並未將商品資訊寫入資料庫中
def addtocart(request,ctype=None,productid=None):
    global cartlist
    
    if ctype == "add": #將商品加入購物車
        product = Product.objects.get(id=productid) #會用get是因為帶入的產品ID一定有在資料表中
        flag = True #預設購物車中沒有相同商品,表示購物車內這個商品不存在
        
        #檢查購物車中的商品是否有重複    
        for unit in cartlist:
            
            #unit[0]:商品名稱 [1]:單價 [2]:數量 [3]:總價
            if product.name == unit[0]:
                unit[2] = str(int(unit[2])+1 ) #數量+1 
                unit[3] = str(int(unit[3])+ product.price ) #價格+價格
                
                flag = False #表示商品之前已加入至購物車中
                break
            
        if flag: #購物車中沒有此商品
            templist = list()
            templist.append(product.name)
            templist.append(str(product.price))
            templist.append("1")
            templist.append(str(product.price))
            cartlist.append(templist)
            
                        
        request.session['cartlist'] = cartlist #將購物車內容存入session中 session是可以將資料儲存在伺服器端，當瀏覽器被關閉 資料就會被清除
        
        return redirect('/cart/') #跳轉至此網址
    
    elif ctype =="update": #更新購物車
        n = 0
        for unit in cartlist: #將購物車的內容抓出來,並修改數量和總價
        
            #debug amount
            amount = request.POST.get('qty'+str(n),'1') #預設數量是1
            if len(amount) == 0 :
                amount = '1'
            elif int(amount) <=0 :
                amount = '1'
                
            unit[2] = amount
            unit[3] = str( int(unit[1]) * int(unit[2]) )
            n += 1 
            
        request.session['carlist'] = cartlist
        return redirect('/cart/')
    
    
    
    elif ctype == "empty": #清空購物車
    
        cartlist = list() #重新指向空的串列
        
        request.session['carlist'] = cartlist
        return redirect('/cart/')
    
    elif ctype == "remove": #刪除內容
        
        del cartlist[int(productid)]
        
        request.session['carlist'] = cartlist
        return redirect('/cart/')
    
    
    
    
    
def cart(request):  #顯示購物車內容用
    global cartlist
    allcart = cartlist
    total = 0  
    for unit in cartlist:
        total+= int(unit[3])
    grandtotal = total + 100 #預設運費為100
    
    return render(request,'cart.html',locals())



def cartorder(request): #結帳畫面
    #要結帳時,是要登入後才能結帳,but先不做登入(?
    
    #12/16補上登入
    if "myMail" in request.session and "isAlive" in request.session:
        global cartlist,customname,customaddress,customemail,customphone
        total = 0
        allcart = cartlist
        
        for unit in cartlist:
            total += int(unit[3])
            
        grandtotal = total + 100
        
        obj = Member.objects.filter(email=request.session["myMail"]).count()
        
        if obj > 0:
            
            user = Member.objects.get(email=request.session["myMail"])
            name = user.name
            phone = customphone
            address = user.address
            email = request.session["myMail"]
            
        else:
        
            name = customname
            phone = customphone
            address = customaddress
            email = request.session["myMail"]
        
        return render(request,'cartorder.html',locals())
    
    else:     
        return HttpResponseRedirect('/login')

def cartok(request): #已確認資料並送出，所以會"將訂單寫入資料庫!"
    global cartlist,customname,customaddress,customemail,customphone
    global orderTotal,goodsTitle
    
    total = 0
    for unit in cartlist:
        total += int(unit[3])
    grandtotal = total + 100
    orderTotal = grandtotal
    
    customname = request.POST.get('cuName','')
    customphone = request.POST.get('cuPhone','')
    customaddress = request.POST.get('cuAddress','') 
    customemail = request.POST.get('cuEmail','')
    payType = request.POST.get('payType','')
    
    #新增資料至訂單資料表中
    unitorder = models.OrdersModel.objects.create(subtotal = total,shipping = 100,grandtotal = grandtotal,customname = customname,customemail = customemail,customphone = customphone,customaddress = customaddress,paytype = payType)
    
    #要將各個商品新增到明細表中
    
    for unit in cartlist:
        goodsTitle.append(unit[0]) #將要買的商品新增至goodsTitle中
        total = int(unit[1]) * int(unit[2])
        unitdetail = models.DetailModel.objects.create(dorder = unitorder, pname = unit[0], unitprice = unit[1],quantity = unit[2],dtotal = total)
        
        
    orderid = unitorder.id
    name = unitorder.customname
    email = unitorder.customemail
    
    
    cartlist = list()
    request.session['cartlist'] = cartlist
    
    if payType == "信用卡":
        return HttpResponseRedirect('/creditcard',locals())
    
    else:
        return render(request,'cartok.html',locals())
        
        
    

def cartordercheck(request): #訂單完成後可以做訂單查詢用
    orderid = request.GET.get('orderid','')
    customemail = request.GET.get('customemail','')
    
    if orderid == '' and customemail == '':
        
        nosearch = 1
        
    else:
        order = models.OrdersModel.objects.filter(id = orderid).first()
        
        if order == None :
            notfound = 1
            
        else:
            details = models.DetailModel.objects.filter(dorder=order)
            
    return render(request,"cartordercheck.html",locals())
    

def myorder(request):
    
    #判斷SESSION是否存在
    #抓出使用者的購買紀錄
    
    if "myMail" in request.session and "isAlive" in request.session:
        
        email = request.session["myMail"]
        
        #用filter用意是不確定資料表內有沒有
        order = models.OrdersModel.objects.filter(customemail=email)
        
        return render(request,'myorder.html',locals())

    else:
        return HttpResponseRedirect('/login')
    
    
def ECPayCredit(request):
    
    global goodsTitle
    title=""
    for i in goodsTitle:
        title += i + "#"   #加#是因為ECPay規定的
        
    
    order_params = {
        'MerchantTradeNo': datetime.now().strftime("NO%Y%m%d%H%M%S"),
        'StoreID': '',
        'MerchantTradeDate': datetime.now().strftime("%Y/%m/%d %H:%M:%S"),
        'PaymentType': 'aio',
        'TotalAmount': orderTotal,
        'TradeDesc': 'Katskon-Meetjob-訂單',
        'ItemName': title,
        'ReturnURL': 'https://www.lccnet.com.tw/lccnet',
        'ChoosePayment': 'Credit',
        'ClientBackURL': 'https://www.lccnet.com.tw/lccnet',
        'ItemURL': 'https://www.ecpay.com.tw/item_url.php',
        'Remark': '交易備註',
        'ChooseSubPayment': '',
        'OrderResultURL': 'https://www.lccnet.com.tw/lccnet',
        'NeedExtraPaidInfo': 'Y',
        'DeviceSource': '',
        'IgnorePayment': '',
        'PlatformID': '',
        'InvoiceMark': 'N',
        'CustomField1': '',
        'CustomField2': '',
        'CustomField3': '',
        'CustomField4': '',
        'EncryptType': 1,
    }

    extend_params_1 = {
        'BindingCard': 0,
        'MerchantMemberID': '',
    }

    extend_params_2 = {
        'Redeem': 'N',
        'UnionPay': 0,
    }

    inv_params = {
        # 'RelateNumber': 'Tea0001', # 特店自訂編號
        # 'CustomerID': 'TEA_0000001', # 客戶編號
        # 'CustomerIdentifier': '53348111', # 統一編號
        # 'CustomerName': '客戶名稱',
        # 'CustomerAddr': '客戶地址',
        # 'CustomerPhone': '0912345678', # 客戶手機號碼
        # 'CustomerEmail': 'abc@ecpay.com.tw',
        # 'ClearanceMark': '2', # 通關方式
        # 'TaxType': '1', # 課稅類別
        # 'CarruerType': '', # 載具類別
        # 'CarruerNum': '', # 載具編號
        # 'Donation': '1', # 捐贈註記
        # 'LoveCode': '168001', # 捐贈碼
        # 'Print': '1',
        # 'InvoiceItemName': '測試商品1|測試商品2',
        # 'InvoiceItemCount': '2|3',
        # 'InvoiceItemWord': '個|包',
        # 'InvoiceItemPrice': '35|10',
        # 'InvoiceItemTaxType': '1|1',
        # 'InvoiceRemark': '測試商品1的說明|測試商品2的說明',
        # 'DelayDay': '0', # 延遲天數
        # 'InvType': '07', # 字軌類別
    }

    # 建立實體
    ecpay_payment_sdk = module.ECPayPaymentSdk(
        MerchantID='2000132',
        HashKey='5294y06JbISpM5x9',
        HashIV='v77hoKGq4kWxNNIS'
    )

    # 合併延伸參數
    order_params.update(extend_params_1)
    order_params.update(extend_params_2)

    # 合併發票參數
    order_params.update(inv_params)

    try:
        # 產生綠界訂單所需參數
        final_order_params = ecpay_payment_sdk.create_order(order_params)

        # 產生 html 的 form 格式
        action_url = 'https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5'  # 測試環境
        # action_url = 'https://payment.ecpay.com.tw/Cashier/AioCheckOut/V5' # 正式環境
        html = ecpay_payment_sdk.gen_html_post_form(action_url, final_order_params)
        
        html = format_html(html) #格式化HTML 將文字html轉換為網頁html Django的功能
        return render(request,'paycredit.html',locals())
    except Exception as error:
        print('An exception happened: ' + str(error))