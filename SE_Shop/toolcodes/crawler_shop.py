import requests

from bs4 import BeautifulSoup

import db

#製造一個Headers 讓他可以去抓網頁的東東

my_header = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36'}

url = "https://store.jp.square-enix.com/item_list.html?SEARCH_MAX_ROW_LIST=100&item_list_mode=1&keyword=FF14&siborikomi_clear=1&sort_order=1&x=0&y=0&request=page&next_page=3"
#request網頁
r = requests.get(url,headers= my_header)

#解決編碼問題
r.encoding='utf-8' 



#過濾一次正常網頁
if r.status_code == 200 : #200是一切正常狀態碼 
    

    soup = BeautifulSoup(r.text,'html.parser') #用parser做html剖析
    
    #利用find_all找所有()內的內容 class可以用來過濾要的
    #利用select可以找< >內的內容 用點連結 最後空白可以抓裡面文字
    
    titleitem= soup.select('div.text h3')
    priceitem= soup.find_all('p',class_='price')
    imgitem = soup.find_all('img',class_='img')
    urlitem = soup.select('div.text a')
    
    cursor = db.conn.cursor()
    

    
    for t,p,i,u in zip(titleitem,priceitem,imgitem,urlitem):
        name = t.text
        name = name.strip()
        price = p.find_all("span")[0].text
        price = price.strip()
        price = price.strip("価格：")
        price = price.strip("セール価格：")
        price = price.strip("円(税込)")
        price = price.replace(",","")
        price = int(price)
        genre = p.find_all("span",class_='genre')[0].text
        genre = genre.strip('ジャンル：')
        photo = i.get('src')
        photo = "https://store.jp.square-enix.com"+photo
        url = u.get('href')
        

        print(name)
        print(price)
        print(genre)
        print(photo)
        print(url)
        
        sql = "select * from product where name='{}' ".format(name)
        cursor.execute(sql)
        db.conn.commit()
        if cursor.rowcount == 0 :
            sql = "insert into product(name,price,genre,photo,url) values('{}','{}','{}','{}','{}')".format(name,price,genre,photo,url)
            cursor.execute(sql)
            db.conn.commit()

    


       

    