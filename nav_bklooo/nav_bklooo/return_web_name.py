from django.shortcuts import render
from django.http import HttpResponse
import json, os


def getWebName(request):
    list = []
    try:
        with open(os.path.join(__file__, "../json/website.json"), encoding="utf-8") as f:
            web_list = json.load(f)
            for i in range(1, 13):
                classifaication = "classification_" + str(i)
                for j in range(1, 7):
                    tr = "tr" + str(j)
                    for k in range(1, 10):
                        td = "td" + str(k)
                        list.append(web_list[classifaication][tr][td]['name'])
    except:
            return HttpResponse("error")
    return render(request, "sitename.html", {"sitename": list})