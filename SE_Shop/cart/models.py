from django.db import models

# Create your models here.

#訂單的model 
class OrdersModel(models.Model):
    subtotal = models.IntegerField(default=0)
    shipping = models.IntegerField(default=0)
    grandtotal = models.IntegerField(default=0)
    customname = models.CharField(max_length=100)
    customemail = models.CharField(max_length=100)
    customphone = models.CharField(max_length=50)
    paytype = models.CharField(max_length=20)
    create_date = models.DateField(auto_now_add=True)
    customaddress = models.CharField(max_length=200)
    
    
    def __str__(self):
        
        return self.customname
    
    

class DetailModel(models.Model):   
    dorder = models.ForeignKey('OrdersModel', on_delete=models.CASCADE)
    #on_delete --> 外來鍵被刪除時,這邊的也會自動被刪除   外來鍵 --> 別的資料表的主鍵
    pname = models.CharField(max_length=100)
    unitprice = models.IntegerField(default=0)
    quantity = models.IntegerField(default=0)
    dtotal = models.IntegerField(default=0)
    
    def __str__(self):
        return self.pname