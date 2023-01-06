from django.db import models

# Create your models here.

class Product(models.Model):
    
    name = models.CharField(max_length=200)
    price = models.IntegerField()
    genre = models.CharField(max_length=100)
    photo = models.CharField(max_length=255)
    url = models.CharField(max_length=255)
    create_date = models.DateField(auto_now_add=True)
    
    class Meta:
        db_table = 'product'