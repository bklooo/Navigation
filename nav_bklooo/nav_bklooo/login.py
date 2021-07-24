from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators import csrf
import json, os


def login(request):
    if request.POST['user'] and request.POST['password']:
        user = request.POST['user']
        password = request.POST['password']
        with open(os.path.join(__file__, "../setting.json"), encoding="utf-8") as f:
            s_list = json.load(f)
            if user==s_list['user'] and password==s_list['password']:
                return render(request, "backstage.html")
            else:
                return HttpResponse("账号或密码错误")
    else:
        return HttpResponse("参数错误")