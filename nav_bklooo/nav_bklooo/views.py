# from django.http import HttpResponse
from django.shortcuts import render


# 主页
def index(request):
    head = {'top_name': '冰阔落导航'}
    return render(request, 'index.html', head)