from django.shortcuts import render

# Create your views here.

from.models import Message

def message(request):
    
    if 'cuName' in request.POST:
        cuName = request.POST['cuName']
        title = request.POST['title']
        content = request.POST['content']
        
        #將資料新增至資料表中的方法
        
        obj = Message.objects.create(subject=title,name=cuName,content=content)        
        obj.save() #記得要save
        
    comment = Message.objects.all().order_by('-id')[:5]
        
    return render(request,"message.html",locals())