# -*- coding: utf-8 -*-
"""
Created on Thu Oct 13 20:58:12 2022

@author: watson
"""

import requests
from bs4 import BeautifulSoup

import db

from datetime import datetime as dt # 抓日期函式庫

today = dt.today() # 抓今天的日期格式

todayS = today.strftime('%Y-%m-%d') # 將設定好的日期格式轉換為字串使用
cursor = db.conn.cursor()

url = "https://zh.m.wikipedia.org/zh-tw/%E5%8F%B0%E7%81%A3%E5%93%BA%E4%B9%B3%E5%8B%95%E7%89%A9%E5%88%97%E8%A1%A8"

data = requests.get(url).text

soup = BeautifulSoup(data,'html.parser')

oneclass=soup.find_all('ol')[21]

species = oneclass.find_all('a')
scien = oneclass.find_all('i')
now_class = 4
family = "牛科"



for info,sci in zip(species,scien):
    name = info.text
    scientific = sci.text
    link = "https://zh.m.wikipedia.org/zh-tw/"+info.get('title')
    print(now_class)
    print(name)
    print(scientific)  
    print(family)
    print(link)
    webdata = requests.get(link).text
    websoup = BeautifulSoup(webdata,'html.parser')
    webpic= websoup.find_all('a',class_="image")
    if len(webpic)>0:
        pic_url = webpic[0].find('img').get('src')
        print(pic_url)
    else:
        pic_url = "https://upload.wikimedia.org/wikipedia/commons/1/1d/No_image.JPG"
        print(pic_url)
    webdis = websoup.find_all('p')
    intro = ""
    for i in webdis:
        intro += i.text
    print(intro)
    
    # sql = "select * from mammals where name='{}' ".format(name)
    # cursor.execute(sql)
    # db.conn.commit()
    # if cursor.rowcount == 0 :
    #     sql = "insert into mammals(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,link,intro,scientific)
    #     cursor.execute(sql)
    #     db.conn.commit()
        
        
    # sql = "select * from allcreatures where name='{}' ".format(name)
    # cursor.execute(sql)
    # db.conn.commit()
    # if cursor.rowcount == 0 :
    #     sql = "insert into allcreatures(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,link,intro,scientific)
    #     cursor.execute(sql)
    #     db.conn.commit()
        

    
# db.conn.close()    
    
    
    




