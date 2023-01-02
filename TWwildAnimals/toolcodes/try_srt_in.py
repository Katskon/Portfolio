# -*- coding: utf-8 -*-
"""
Created on Fri Dec 30 21:00:54 2022

@author: user
"""
import db
import random

# index_id1 = random.randint(1, 349)
# index_id2 = random.randint(1, 349)
# index_id3 = random.randint(1, 349)
# index_id4 = random.randint(1, 349)
# index_id5 = random.randint(1, 349)

# ids = (index_id1,index_id2,index_id3,index_id4,index_id5)

# sql = "SELECT * from allcreatures where id in{}".format(ids)


# cursor = db.conn.cursor()
# cursor.execute(sql)
# db.conn.commit()
# item = cursor.fetchall()

# print(item)
cursor = db.conn.cursor()
count_sql = "select count(*) from allcreatures"
cursor.execute(count_sql)
db.conn.commit()
count = cursor.fetchone()
print(count[0])

qid = random.randint(1, count[0])
sql = "select * from allcreatures where id={}".format(qid)
cursor = db.conn.cursor()
cursor.execute(sql)
db.conn.commit()
question = cursor.fetchone()

print(question)