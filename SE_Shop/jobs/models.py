from django.db import models

# Create your models here.

class Jobs(models.Model):
    jobname = models.CharField(max_length=50)
    Classifi = models.CharField(max_length=50)
    link = models.CharField(max_length=255)
    photo = models.CharField(max_length=255)
    icon = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    
    class Meta:
        
        db_table = "jobs"
        

# models 下完 記得去 admin註冊後台