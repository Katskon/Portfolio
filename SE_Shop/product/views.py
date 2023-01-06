from django.shortcuts import render

# Create your views here.
#如果跟資料庫相關要去models建立資料庫

from .models import Product
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger

# Create your views here.

def product(request):
    
    
    if 'type' in request.GET:
        
        goodstype = request.GET['type']
        
        if goodstype == 'ミュージック':
            allgoods = Product.objects.filter(genre__in=['サウンドトラック','アレンジ','オーケストラ','映像付きサウンドトラック','コンサートDVD/Blu-ray','アナログレコード'])
        elif goodstype == 'ゲーム':
            allgoods = Product.objects.filter(genre='MMORPG')
        elif goodstype == 'ブック':
            allgoods = Product.objects.filter(genre__in=['公式ガイドブック・設定資料集','ゲーム画集・コミック画集','コミック','ポストカードブック','ファンブック・その他','学習参考書・えほん'])
        elif goodstype == 'グッズ':
            allgoods = Product.objects.filter(genre__in=['フィギュア・プラモデル','ぬいぐるみ・マスコット','キーホルダー・ストラップ','腕時計・アクセサリー','アパレル','バッグ・ポーチ・財布','スマホ関連','キッチン雑貨','複製原画・アート','カード／ボードゲーム','雑貨・その他','お酒'])
        
            
        else:
            allgoods = Product.objects.all()

        

            
        
    else:
        
        #抓取資料庫內容的語法:抓取全部資料以id欄位遞減排序
        allgoods = Product.objects.all()
       
        
       
    paginator = Paginator(allgoods, 10)  
    page = request.GET.get('page')
    try:
        allgoods = paginator.page(page)
    except PageNotAnInteger:
        allgoods = paginator.page(1)
    except EmptyPage:
        allgoods = paginator.page(paginator.num_pages)
    
    return render(request,"product.html",locals())