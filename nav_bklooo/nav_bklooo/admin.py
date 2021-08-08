from django.shortcuts import render
from django.http import HttpResponse
import json
import os


def admin(request):
    if request.POST:
        try:
            user = request.POST['user']
            password = request.POST['password']
            with open(os.path.join(__file__, "../setting.json"), encoding="utf-8") as f:
                s_list = json.load(f)
                if user == s_list['user'] and password == s_list['password']:
                    return render(request, "backstage.html")
                else:
                    return HttpResponse("账号或密码错误")
        except:
            pass
    else:
        return render(request, "admin.html")
