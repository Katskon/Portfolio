from django.shortcuts import render
import hashlib
from .models import Member
from django.http import HttpResponseRedirect,HttpResponse

# Create your views here.


def login(request):
    msg= ""
    
    if "email" in request.POST:
        email = request.POST["email"]
        password = request.POST["password"]
        password = hashlib.sha3_256(password.encode('utf-8')).hexdigest() #高版本
        
        obj = Member.objects.filter(email=email,password=password).count()
        if obj > 0 : #表示資料表中有此使用者且密碼正確
            #建立session物件
            #可以暫時存在伺服器端 當瀏覽器關閉時 SESSION內的值就會不見
            #打開瀏覽器時 會主動向伺服器端抓取id 每次都不同
            #儲存在本地端電腦的稱為COOKIES
            
            request.session['myMail'] = email #儲存session資料
            request.session['isAlive'] = True 
            
            #加上Cookie功能時 若使用者禁用則失效          
            
            #宣告 Cookie物件         
            response = HttpResponseRedirect("/")
            #max_age 最大存活時間  此處1200(sec)
            response.set_cookie("UMail",email,max_age=1200)
            
            return response #指向根目錄
        
        else:
            msg = "帳密錯誤請重新輸入"
            return render(request, 'login.html',locals())
        
    else:
        
        if "myMail" in request.session and "isAlive" in request.session:
            return HttpResponseRedirect("/member")
        else:
            myemail = request.COOKIES.get("UMail","") #抓取Cookie的值 若無則空白
            return render(request, "login.html",locals())
            

def logout(request):
    
    #刪除session內容
    del request.session["isAlive"]
    del request.session["myMail"]
    
    #刪除cookie內容
    response = HttpResponseRedirect("/login")
    response.delete_cookie("UMail")
    
    return response
    

    #另一種寫法 HttpResponse 要記得 import
    
    # response = HttpResponse("Delete Cookie")
    # response.delete_cookie("UMail")
    # return HttpResponseRedirect("/login")
    
   


def register(request):
    
    msg = ""
    
    if 'userName' in request.POST:
        username = request.POST['userName']
        email = request.POST['email']
        password = request.POST['pwd']
        sex = request.POST['sex']
        birthday = request.POST['birthday']
        address = request.POST['address']
        
        #加密SHA256
        #password = hashlib.sha256(password.encode('utf-8')).hexdigest() #舊版本
        
        password = hashlib.sha3_256(password.encode('utf-8')).hexdigest() #高版本
        
        #此行是要查詢email是否已存在 
        obj = Member.objects.filter(email=email).count()
        
        if obj == 0: 
            #E-mail不存在 新增會員資料
            Member.objects.create(name=username, sex=sex, birthday=birthday, email=email, address=address, password=password)
            msg = "您已完成會員註冊"
            
        else:
            msg = "此E-mail已存在,請利用新的E-mail註冊"
        
        
    return render(request, 'register.html',locals())


def manage(request):
    
    #要判斷是否已經登入，若未登入要導回登入頁
    
    
    if "myMail" in request.session and "isAlive" in request.session:
        
        msg = ""
        
        if "oldpwd" in request.POST:
            
            oldpwd = request.POST['oldpwd']
            newpwd = request.POST['newpwd']
            
            #確認使用者輸入的舊密碼為正確舊密碼
            oldpwd = hashlib.sha3_256(oldpwd.encode('utf-8')).hexdigest()
            newpwd = hashlib.sha3_256(newpwd.encode('utf-8')).hexdigest()
            
            email = request.session['myMail']
            
            #查詢語法 確認email password相同的obj是否存在
            obj = Member.objects.filter(email=email,password=oldpwd)
            
            if obj.count()>0:               
                #更新密碼
                user = Member.objects.get(email=email)
                #變更資料庫 ==> 直接 obj.欄位 = 更新  .save()記得下
                user.password = newpwd
                user.save()
                msg = "密碼已變更完成"
            else:
                mse = "舊密碼不正確請重新輸入"
        
        
        return render(request,'manage.html',locals())
    
    else:
        return HttpResponseRedirect('/login')