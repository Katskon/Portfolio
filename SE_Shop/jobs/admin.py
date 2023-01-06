from django.contrib import admin

# Register your models here.

#註冊在後台


from .models import Jobs

admin.site.register(Jobs)


#註冊完進prompt makemigrantions migrant