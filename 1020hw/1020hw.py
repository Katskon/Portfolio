import db1020
from datetime import datetime

function = input("請輸入欲使用功能(1:新增員工,2:新增工作項目,3:修改員工資料,4:員編查詢員工資料,5:員編查詢作業):")

if function == "1":
    
    print("請輸入新增員工資料")
    name = input("姓名:")
    sex = input("性別(F/M):")
    tel = input("電話:")
    now = datetime.now()
    
    sql = "insert into employee(name,sex,tel,assume) values('{}','{}','{}','{}')".format(name,sex,tel,now)
    
    cursor = db1020.conn.cursor()
    cursor.execute(sql)
    db1020.conn.commit()  
    db1020.conn.close()
    
    
elif function == "2":
    
    print("請輸入新增作業")
    
    item = input("請輸入工作項目:")
    info = input("請輸入工作大綱:")
    employeeid = int(input("作業員工編號:"))
    
    sql = "insert into works(item,info,employeeid) values('{}','{}','{}')".format(item,info,employeeid)
    cursor = db1020.conn.cursor()
    cursor.execute(sql)
    db1020.conn.commit()  
    db1020.conn.close()
    
    
elif function == "3":
    
    print("修改員工資料")
    print()
    print("目前可修改電話,性別")
    
    fixid = input("請輸入欲修改之員編:")
    fixtel = input("請輸入修改後電話:")
    fixsex = input("請輸入修改後性別(F/M):")
    
    sql = "update employee set tel='{}',sex='{}' where id = '{}'".format(fixtel,fixsex,fixid)
    cursor = db1020.conn.cursor()
    cursor.execute(sql)
    db1020.conn.commit()  
    db1020.conn.close()
    
elif function == "4":
    
    print("輸入員編查詢員工資料")
    print()
    
    findid = input("請輸入欲查詢之員編:")
    sql = "select id,name,sex,tel from employee where id = '{}'".format(findid)
    cursor = db1020.conn.cursor()
    cursor.execute(sql)
    db1020.conn.commit()
    finddata = cursor.fetchall()
    
    for row in finddata:
        
        print("員工編號:",row[0])
        print("員工姓名:",row[1])
        print("員工性別:",row[2])
        print("員工電話:",row[3])
    
    db1020.conn.close()
    
    
elif function == "5":
    
    print("輸入員編查詢工作項目")
    
    workid = input("請輸入欲查詢之員編:")
    
    sql = "select employee.name,works.item,works.info from employee left join works on employee.id = works.employeeid where employee.id = '{}'".format(workid)
    cursor = db1020.conn.cursor()
    cursor.execute(sql)
    db1020.conn.commit()
    workdata = cursor.fetchall()
    print("員工姓名","工作項目","工作詳述")
    for row in workdata:
        print(row[0],row[1],row[2])
    
    
    