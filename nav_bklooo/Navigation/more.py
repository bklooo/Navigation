from django.shortcuts import render
from Navigation.models import msg
import urllib.parse


def more(request):
    request.encoding = 'utf-8'
    if request.GET['class']:
        r = request.GET['class']
        data = urllib.parse.unquote(r)
        msglist = msg.objects.all().order_by("-time").values()
        result = []
        for i in msglist:
            if data == i['type']:
                result.append(i)
        if len(result) != 0:
            return render(request, "more.html", {"result": result, "classification": data})
        else:
            return render(request, "more.html", {"null": "抱歉，数据为空"})

    else:
        return render(request, "more.html", {"null": "参数为空"})
