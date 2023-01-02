import db

startPage = 1

sql = "select * from allcreatures order by id desc limit {},{}".format(startPage*10,10)
count_sql = "select count(*) from allcreatures"


cursor = db.conn.cursor()
cursor.execute(sql)
db.conn.commit()
result = cursor.fetchall()

cursor.execute(count_sql)
db.conn.commit()
res = cursor.fetchone()



print(res[0])