# from django.http import HttpResponse
from django.shortcuts import render
import os, json, random


# 主页
def index(request):
    loop_list3 = [1, 2, 3]
    loop_list6 = [1, 2, 3, 4, 5, 6]
    loop_list9 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    loop_list12 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    tag_style = ['default', 'primary', 'success', 'info', 'warning', 'danger']
    with open(os.path.join(__file__, "../../statics/json/class_list.json"), encoding='utf-8') as f:
        class_list = json.load(f)['class_list']
    re_dist = {
        'class_list': class_list,
        'loop_list3': loop_list3,
        'loop_list6': loop_list6,
        'loop_list9': loop_list9,
        'loop_list12': loop_list12,
        'tag_style': random.choice(tag_style)
    }
    return render(request, 'index.html', re_dist)
