from django.shortcuts import render
from django.http import HttpResponse
from Navigation.models import msg


def searchAll(request):
    request.encoding = 'utf-8'
    if request.POST['s']:
        s = request.POST['s']
        msglist = msg.objects.all().values()
        result = []
        for i in msglist:
            if s in i['name']:
                result.append(i)
            elif i['info'] and s in i['info']:
                result.append(i)
            elif s in i['link']:
                result.append(i)
        if len(result) != 0:
            return render(request, "s_result.html", {"result": result})
        else:
            return render(request, "s_result.html", {"null": "抱歉，数据为空"})

    else:
        return render(request, "s_result.html", {"null": "搜索参数为空"})
