import pymysql

dbsetting = {
    "host":"127.0.0.1", #本地端
    "port":3306, #跟資料庫連接預設3306
    "user":"root", #之後不會用root
    "password":"61004jason",
    "db":"jobs", #要用的資料庫
    "charset":"utf8"
    }

conn = pymysql.connect(**dbsetting)