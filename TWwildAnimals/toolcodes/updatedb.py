# -*- coding: utf-8 -*-
"""
Created on Thu Dec 29 20:36:03 2022

@author: user
"""

import db


pic_url = "https://pic.pimg.tw/adolphus/1176805180.jpg"


sql ="update allcreatures set pic_url = '{}' where name = '小麝鼩'".format(pic_url)
cursor = db.conn.cursor()
cursor.execute(sql)
db.conn.commit()



    

