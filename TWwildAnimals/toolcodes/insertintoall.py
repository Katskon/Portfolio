# -*- coding: utf-8 -*-
"""
Created on Thu Dec 29 20:36:03 2022

@author: user
"""

import db





sql ="select * from birds"


cursor = db.conn.cursor()
cursor.execute(sql)
db.conn.commit()

result = cursor.fetchall()

for row in result:
    now_class = row[1]
    name = row[2]
    family = row[3]
    pic_url = row[4]
    url = row[5]
    introduction = row[6]
    scientific = row[7]
    print(introduction,scientific)

    allsql = "insert into allcreatures(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,url,introduction,scientific)
    
    cursor = db.conn.cursor()
    cursor.execute(allsql)
    db.conn.commit()
    
    

