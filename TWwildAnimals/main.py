from flask import Flask,render_template,request,url_for,redirect
import db
import random

#分頁時要使用的
from flask_paginate import Pagination,get_page_parameter


app = Flask(__name__)

@app.route("/")
def index():
    
    
    return render_template('index.html')


@app.route("/index")
def home():
    
    return render_template('index.html')


@app.route("/species")
def species():
    
    #計算資料庫總數    
    cursor = db.conn.cursor()
    count_sql = "select count(*) from allcreatures"
    cursor.execute(count_sql)
    db.conn.commit()
    count = cursor.fetchone()
    
    ids = []
    for i in range(1,11):
        ids.append(random.randint(1, count[0]))
    ids = tuple(ids)   
    sql = "SELECT * from allcreatures where id in{}".format(ids)


    cursor = db.conn.cursor()
    cursor.execute(sql)
    db.conn.commit()
    item = cursor.fetchall()
    
    
    return render_template('species.html',**locals())

@app.route("/amphibians",methods = ['GET'])
def amphibians():
    
    
    btn_sql = "SELECT DISTINCT family from amphibians"
    cursor = db.conn.cursor()
    cursor.execute(btn_sql)
    db.conn.commit()
    item = cursor.fetchall()
    
    type_amphibians = request.args.get('type')
    page = request.args.get('page')
    
    
    if page == None:
        
        page=1
    
        if type_amphibians == None:
            sql = "select * from amphibians order by id limit 6"
            count_sql = "select count(*) from amphibians"
        elif type_amphibians == item[0][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[0][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[0][0])
        elif type_amphibians == item[1][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[1][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[1][0])
        elif type_amphibians == item[2][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[2][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[2][0])
        elif type_amphibians == item[3][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[3][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[3][0])
        elif type_amphibians == item[4][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[4][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[4][0])
        elif type_amphibians == item[5][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[5][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[5][0])
        elif type_amphibians == item[6][0]:
            sql = "select * from amphibians where family = '{}' limit 6".format(item[6][0])
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[6][0])
        else:
            sql = "select * from amphibians order by id limit 6"
            
            
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
            
        pagination=Pagination(page=page,total=count,per_page=6)
        
        return render_template('amphibians.html',**locals())
    
    else:
        
        page = request.args.get(get_page_parameter(),type=int,default=int(page))
        startPage = page-1
        
        if type_amphibians == None:
            sql = "select * from amphibians order by id limit {},6".format(startPage*6)
            count_sql = "select count(*) from amphibians"
        elif type_amphibians == item[0][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[0][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[0][0])
        elif type_amphibians == item[1][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[1][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[1][0])
        elif type_amphibians == item[2][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[2][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[2][0])
        elif type_amphibians == item[3][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[3][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[3][0])
        elif type_amphibians == item[4][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[4][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[4][0])
        elif type_amphibians == item[5][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[5][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[5][0])
        elif type_amphibians == item[6][0]:
            sql = "select * from amphibians where family = '{}' limit {},6".format(item[6][0],startPage*6)
            count_sql = "select count(*) from amphibians where family = '{}'".format(item[6][0])
        else:
            sql = "select * from amphibians order by id limit 6"
            
            
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
            
        pagination=Pagination(page=page,total=count,per_page=6)
        
        return render_template('amphibians.html',**locals())
        
        


@app.route("/birds",methods = ['GET'])
def birds():
    
    type_bird = request.args.get('type')
    page = request.args.get('page')
    
    if page == None:
        
        page = 1
    
        if type_bird == None:
            sql = "select * from birds order by id limit 6"
            count_sql = "select count(*) from birds"
        elif type_bird == "走禽":
            sql = "select * from birds where family in ('{}','{}') order by id limit 6".format("三趾鶉科","雉科")
            count_sql = "select count(*) from birds where family in ('{}','{}')".format("三趾鶉科","雉科")
        elif type_bird == "涉禽":
            sql = "select * from birds where family in ('{}','{}','{}','{}','{}','{}','{}') order by id limit 6".format("水雉科","長腳鷸科","秧雞科","彩鷸科","鷺科","鴴科","䴉科")
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}','{}','{}','{}')".format("水雉科","長腳鷸科","秧雞科","彩鷸科","鷺科","鴴科","䴉科")
        elif type_bird == "水禽":
            sql = "select * from birds where family in ('{}','{}','{}') order by id limit 6".format("雁鴨科","翠鳥科","鷗科")
            count_sql = "select count(*) from birds where family in ('{}','{}','{}')".format("雁鴨科","翠鳥科","鷗科")
        elif type_bird == "猛禽":
            sql = "select * from birds where family in ('{}','{}','{}','{}') order by id limit 6".format("草鴞科","隼科","鴟鴞科","鷹科")
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}')".format("草鴞科","隼科","鴟鴞科","鷹科")
        elif type_bird == "雜食性":
            sql = "select * from birds where family in ('{}') order by id limit 6".format("鴉科")
            count_sql = "select count(*) from birds where family in ('{}')".format("鴉科")
        elif type_bird == "素食性":
            sql = "select * from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}') order by id limit 6".format("啄花科","梅花雀科","雀科","麻雀科","黃鸝科","鳩鴿科","鵯科","鶇科","鬚鴷科")
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}')".format("啄花科","梅花雀科","雀科","麻雀科","黃鸝科","鳩鴿科","鵯科","鶇科","鬚鴷科")
        elif type_bird == "蟲食性":
            sql = "select * from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}') limit 6".format("八色鳥科","八哥科","山雀科","山椒鳥科","王鶲科","百靈科","伯勞科","杜鵑科","卷尾科","夜鷹科","岩鷚科","河烏科","長尾山雀科","雨燕科","扇尾鶯科","啄木鳥科","畫眉科","綠鵙科","蝗鶯科","噪眉科","樹鶯科","燕科","戴勝科","戴菊科","繡眼科","鸚嘴科","鶺鴒科","鶲科","鷦眉科","鷦鷯科","鳾科")
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format("八色鳥科","八哥科","山雀科","山椒鳥科","王鶲科","百靈科","伯勞科","杜鵑科","卷尾科","夜鷹科","岩鷚科","河烏科","長尾山雀科","雨燕科","扇尾鶯科","啄木鳥科","畫眉科","綠鵙科","蝗鶯科","噪眉科","樹鶯科","燕科","戴勝科","戴菊科","繡眼科","鸚嘴科","鶺鴒科","鶲科","鷦眉科","鷦鷯科","鳾科")
        else:
            sql = "select * from birds order by id limit 6"
        
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
        
        pagination=Pagination(page=page,total=count,per_page=6)
    
        return render_template("birds.html",**locals())
    else:
        
        #表示使用者有按分頁了(上一頁 下一頁)
        page = request.args.get(get_page_parameter(),type=int,default=int(page))
        startPage = page-1
        
        if type_bird == None:
            sql = "select * from birds order by id limit {},6".format(startPage*6)
            count_sql = "select count(*) from birds"
        elif type_bird == "走禽":
            sql = "select * from birds where family in ('{}','{}') order by id limit {},6".format("三趾鶉科","雉科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}','{}')".format("三趾鶉科","雉科")
        elif type_bird == "涉禽":
            sql = "select * from birds where family in ('{}','{}','{}','{}','{}','{}','{}') order by id limit {},6".format("水雉科","長腳鷸科","秧雞科","彩鷸科","鷺科","鴴科","䴉科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}','{}','{}','{}')".format("水雉科","長腳鷸科","秧雞科","彩鷸科","鷺科","鴴科","䴉科")
        elif type_bird == "水禽":
            sql = "select * from birds where family in ('{}','{}','{}') order by id limit {},6".format("雁鴨科","翠鳥科","鷗科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}','{}','{}')".format("雁鴨科","翠鳥科","鷗科")
        elif type_bird == "猛禽":
            sql = "select * from birds where family in ('{}','{}','{}','{}') order by id limit {},6".format("草鴞科","隼科","鴟鴞科","鷹科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}')".format("草鴞科","隼科","鴟鴞科","鷹科")
        elif type_bird == "雜食性":
            sql = "select * from birds where family in ('{}') order by id limit {},6".format("鴉科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}')".format("鴉科")
        elif type_bird == "素食性":
            sql = "select * from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}') order by id limit {}, 6".format("啄花科","梅花雀科","雀科","麻雀科","黃鸝科","鳩鴿科","鵯科","鶇科","鬚鴷科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}')".format("啄花科","梅花雀科","雀科","麻雀科","黃鸝科","鳩鴿科","鵯科","鶇科","鬚鴷科")
        elif type_bird == "蟲食性":
            sql = "select * from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}') limit {},6".format("八色鳥科","八哥科","山雀科","山椒鳥科","王鶲科","百靈科","伯勞科","杜鵑科","卷尾科","夜鷹科","岩鷚科","河烏科","長尾山雀科","雨燕科","扇尾鶯科","啄木鳥科","畫眉科","綠鵙科","蝗鶯科","噪眉科","樹鶯科","燕科","戴勝科","戴菊科","繡眼科","鸚嘴科","鶺鴒科","鶲科","鷦眉科","鷦鷯科","鳾科",startPage*6)
            count_sql = "select count(*) from birds where family in ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format("八色鳥科","八哥科","山雀科","山椒鳥科","王鶲科","百靈科","伯勞科","杜鵑科","卷尾科","夜鷹科","岩鷚科","河烏科","長尾山雀科","雨燕科","扇尾鶯科","啄木鳥科","畫眉科","綠鵙科","蝗鶯科","噪眉科","樹鶯科","燕科","戴勝科","戴菊科","繡眼科","鸚嘴科","鶺鴒科","鶲科","鷦眉科","鷦鷯科","鳾科")
        else:
            sql = "select * from birds order by id limit {},6".format(startPage*6)
        
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
        
        pagination=Pagination(page=page,total=count,per_page=6)
    
        return render_template("birds.html",**locals())
        

@app.route("/mammals",methods = ['GET'])
def mammals():
    
    type_mammals = request.args.get('type')
    page = request.args.get('page')
    
    if page == None:
        
        page = 1
    
        if type_mammals == None:
            sql = "select * from mammals order by id limit 6"
            count_sql = "select count(*) from mammals"
        elif type_mammals == "翼手目":
            sql = "select * from mammals where family in ('{}','{}','{}','{}') order by id limit 6".format("大蝙蝠科","蹄鼻蝠科","葉鼻蝠科","蝙蝠科")
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}','{}')".format("大蝙蝠科","蹄鼻蝠科","葉鼻蝠科","蝙蝠科")
        elif type_mammals == "囓齒目":
            sql = "select * from mammals where family in ('{}','{}','{}') order by id limit 6".format("松鼠科","鼠科","倉鼠科")
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}')".format("松鼠科","鼠科","倉鼠科")
        elif type_mammals == "食肉目":
            sql = "select * from mammals where family in ('{}','{}','{}','{}','{}') order by id limit 6".format("熊科","貂科","靈貓科","獴科","貓科")
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}','{}','{}')".format("熊科","貂科","靈貓科","獴科","貓科")
        elif type_mammals == "鯨偶蹄目":
            sql = "select * from mammals where family in ('{}','{}','{}') order by id limit 6".format("豬科","鹿科","牛科")
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}')".format("豬科","鹿科","牛科")
        elif type_mammals == "其他":
            sql = "select * from mammals where family in ('{}','{}','{}','{}','{}') order by id limit 6".format("鼴鼠科","鼩鼱科","獼猴科","穿山甲科","兔科")
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}','{}','{}')".format("鼴鼠科","鼩鼱科","獼猴科","穿山甲科","兔科")
        else:
            sql = "select * from mammals order by id limit 6"
        
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
        
        pagination=Pagination(page=page,total=count,per_page=6)
    
        return render_template("mammals.html",**locals())
    else:
        
        #表示使用者有按分頁了(上一頁 下一頁)
        page = request.args.get(get_page_parameter(),type=int,default=int(page))
        startPage = page-1
        
        if type_mammals == None:
            sql = "select * from mammals order by id limit {},6".format(startPage*6)
            count_sql = "select count(*) from mammals"
        elif type_mammals == "翼手目":
            sql = "select * from mammals where family in ('{}','{}','{}','{}') order by id limit {},6".format("大蝙蝠科","蹄鼻蝠科","葉鼻蝠科","蝙蝠科",startPage*6)
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}','{}')".format("大蝙蝠科","蹄鼻蝠科","葉鼻蝠科","蝙蝠科")
        elif type_mammals == "囓齒目":
            sql = "select * from mammals where family in ('{}','{}','{}') order by id limit {},6".format("松鼠科","鼠科","倉鼠科",startPage*6)
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}')".format("松鼠科","鼠科","倉鼠科")
        elif type_mammals == "食肉目":
            sql = "select * from mammals where family in ('{}','{}','{}','{}','{}') order by id limit {},6".format("熊科","貂科","靈貓科","獴科","貓科",startPage*6)
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}','{}','{}')".format("熊科","貂科","靈貓科","獴科","貓科")
        elif type_mammals == "鯨偶蹄目":
            sql = "select * from mammals where family in ('{}','{}','{}') order by id limit {},6".format("豬科","鹿科","牛科",startPage*6)
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}')".format("豬科","鹿科","牛科")
        elif type_mammals == "其他":
            sql = "select * from mammals where family in ('{}','{}','{}','{}','{}') order by id limit {},6".format("鼴鼠科","鼩鼱科","獼猴科","穿山甲科","兔科",startPage*6)
            count_sql = "select count(*) from mammals where family in ('{}','{}','{}','{}','{}')".format("鼴鼠科","鼩鼱科","獼猴科","穿山甲科","兔科")
        else:
            sql = "select * from mammals order by id limit {},6".format(startPage*6)
        
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
        
        pagination=Pagination(page=page,total=count,per_page=6)
    
        return render_template("mammals.html",**locals())
    
    


@app.route("/reptiles",methods = ['GET'])
def reptiles():
    
    type_reptiles = request.args.get('type')
    page = request.args.get('page')
    
    if page == None:
        
        page = 1
    
        if type_reptiles == None:
            sql = "select * from reptiles order by id limit 6"
            count_sql = "select count(*) from reptiles"
        elif type_reptiles == "龜鱉目":
            sql = "select * from reptiles where family in ('{}','{}','{}','{}') order by id limit 6".format("蠵龜科","澤龜科","地龜科","鱉科")
            count_sql = "select count(*) from reptiles where family in ('{}','{}','{}','{}')".format("蠵龜科","澤龜科","地龜科","鱉科")
        elif type_reptiles == "蛇亞目":
            sql = "select * from reptiles where family in ('{}','{}','{}','{}','{}','{}','{}') order by id limit 6".format("黃頷蛇科","蝙蝠蛇科","水蛇科","鈍頭蛇科","盲蛇科","閃皮蛇科","蝮蛇科")
            count_sql = "select count(*) from reptiles where family in ('{}','{}','{}','{}','{}','{}','{}')".format("黃頷蛇科","蝙蝠蛇科","水蛇科","鈍頭蛇科","盲蛇科","閃皮蛇科","蝮蛇科")
        elif type_reptiles == "鬣蜥蜥蜴亞目":
            sql = "select * from reptiles where family in ('{}','{}','{}','{}','{}') order by id limit 6".format("飛蜥科","蛇蜥科","壁虎科","正蜥科","石龍子科")
            count_sql = "select count(*) from reptiles where family in ('{}','{}','{}','{}','{}')".format("飛蜥科","蛇蜥科","壁虎科","正蜥科","石龍子科")
        
        
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
        
        pagination=Pagination(page=page,total=count,per_page=6)
    
        return render_template("reptiles.html",**locals())
    else:
        
        #表示使用者有按分頁了(上一頁 下一頁)
        page = request.args.get(get_page_parameter(),type=int,default=int(page))
        startPage = page-1
        
        if type_reptiles == None:
            sql = "select * from reptiles order by id limit {},6".format(startPage*6)
            count_sql = "select count(*) from reptiles"
        elif type_reptiles == "龜鱉目":
            sql = "select * from reptiles where family in ('{}','{}','{}','{}') order by id limit {},6".format("蠵龜科","澤龜科","地龜科","鱉科",startPage*6)
            count_sql = "select count(*) from reptiles where family in ('{}','{}','{}','{}')".format("蠵龜科","澤龜科","地龜科","鱉科")
        elif type_reptiles == "蛇亞目":
            sql = "select * from reptiles where family in ('{}','{}','{}','{}','{}','{}','{}') order by id limit {},6".format("黃頷蛇科","蝙蝠蛇科","水蛇科","鈍頭蛇科","盲蛇科","閃皮蛇科","蝮蛇科",startPage*6)
            count_sql = "select count(*) from reptiles where family in ('{}','{}','{}','{}','{}','{}','{}')".format("黃頷蛇科","蝙蝠蛇科","水蛇科","鈍頭蛇科","盲蛇科","閃皮蛇科","蝮蛇科")
        elif type_reptiles == "鬣蜥蜥蜴亞目":
            sql = "select * from reptiles where family in ('{}','{}','{}','{}','{}') order by id limit {},6".format("飛蜥科","蛇蜥科","壁虎科","正蜥科","石龍子科",startPage*6)
            count_sql = "select count(*) from reptiles where family in ('{}','{}','{}','{}','{}')".format("飛蜥科","蛇蜥科","壁虎科","正蜥科","石龍子科")
        
        
        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        result = cursor.fetchall()
        
        cursor.execute(count_sql)
        db.conn.commit()
        res = cursor.fetchone() #一維串列
        count = int(res[0]) #抓到全部筆數
        
        pagination=Pagination(page=page,total=count,per_page=6)
    
        return render_template("reptiles.html",**locals())





@app.route("/addcreature")
def addcreature():
    return render_template("addcreature.html")

@app.route("/addProcess",methods=['POST'])
def addContact():
    if request.method == 'POST':
                
        now_class = request.form.get('now_class')
        name = request.form.get('name')
        family = request.form.get('family')
        pic_url = request.form.get('pic_url')
        url = request.form.get('url')
        introduction = request.form.get('introduction')
        scientific = request.form.get('scientific')
        
        #開始下sql語法
        sql = "insert into birds(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,url,introduction,scientific)


        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()

        sql = "insert into allcreatures(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,url,introduction,scientific)


        cursor = db.conn.cursor()
        cursor.execute(sql)
        db.conn.commit()
        
    #return render_template("contact.html") 網址不會改變 會導向到"/addMessage"
    return redirect(url_for('addcreature')) # 導向到 'function' 所以要下 "message"


@app.route("/about")
def about():
    
    return render_template("about.html")


@app.route("/random")
def randomsp():
    
    #計算資料庫總數    
    cursor = db.conn.cursor()
    count_sql = "select count(*) from allcreatures"
    cursor.execute(count_sql)
    db.conn.commit()
    count = cursor.fetchone()
    qid = random.randint(1, count[0])
    sql = "select * from allcreatures where id={}".format(qid)
    cursor = db.conn.cursor()
    cursor.execute(sql)
    db.conn.commit()
    question = cursor.fetchone()
    
    
    return render_template("quiz.html",**locals())





if __name__ == "__main__":
    app.run(debug=True)