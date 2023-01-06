from django.shortcuts import render

# Create your views here.

from .models import Jobs

def jobs(request): 
    
    if 'jobname' in request.GET:
        
        jobname = request.GET['jobname']
        tank = Jobs.objects.filter(Classifi="タンク")
        healer = Jobs.objects.filter(Classifi="ヒーラー")
        melee = Jobs.objects.filter(Classifi="近接物理DPS")
        ranged = Jobs.objects.filter(Classifi="遠隔物理DPS")
        caster = Jobs.objects.filter(Classifi="遠隔魔法DPS")
        showcase = Jobs.objects.filter(jobname=jobname)
        

    else:
        tank = Jobs.objects.filter(Classifi="タンク")
        healer = Jobs.objects.filter(Classifi="ヒーラー")
        melee = Jobs.objects.filter(Classifi="近接物理DPS")
        ranged = Jobs.objects.filter(Classifi="遠隔物理DPS")
        caster = Jobs.objects.filter(Classifi="遠隔魔法DPS")
        showcase = Jobs.objects.filter(jobname='ナイト')
        
        
    return render(request,'jobs.html',locals())

