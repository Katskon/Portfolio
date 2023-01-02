import db

now_class = 1
name = "花狹口蛙"
family = "狹口蛙科"
pic_url = "https://zh.m.wikipedia.org/zh-tw/%E8%8A%B1%E7%8B%AD%E5%8F%A3%E8%9B%99#/media/File%3AChubbyFrog_02.jpg"
url = "https://zh.m.wikipedia.org/zh-tw/%E8%8A%B1%E7%8B%AD%E5%8F%A3%E8%9B%99"
introduction = "亞洲錦蛙又名花狹口蛙，為狹口蛙科狹口蛙屬的兩棲動物。分布範圍從緬甸，泰國，寮國，柬埔寨和越南，南部向馬來半島，印尼的蘇門答臘、婆羅洲(坤甸)， 蘇拉威西島 (錫江、帕盧 和弗洛勒斯島)和刁曼島、布吉島、蘭卡威 和新加坡。 印度東北部(西孟加拉邦西部和阿薩姆)和孟加拉國。 在中國大陸，分布於福建、廣東、廣西、海南、雲南等地。該物種的產地在中國。本種亦被引進至台灣。背部有黃色紋路，體長7-8厘米，壽命可達10年。"
scientific = "Kaloula pulchra"


sql = "insert into amphibians(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,url,introduction,scientific)


cursor = db.conn.cursor()
cursor.execute(sql)
db.conn.commit()

sql = "insert into allcreatures(now_class,name,family,pic_url,url,introduction,scientific) values('{}','{}','{}','{}','{}','{}','{}')".format(now_class,name,family,pic_url,url,introduction,scientific)


cursor = db.conn.cursor()
cursor.execute(sql)
db.conn.commit()