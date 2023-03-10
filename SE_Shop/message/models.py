from django.db import models

# Create your models here.

class Message(models.Model):
    
    subject = models.CharField(max_length=50)
    name = models.CharField(max_length=50)
    content = models.TextField()
    create_date = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        db_table = 'message'