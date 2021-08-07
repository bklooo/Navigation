# Update home page
from types import FrameType
from Navigation.models import msg
import os, json
import random
from django.http import HttpResponse


def updateWeb(request):
    msglist = msg.objects.all().values('name', 'link', 'icon', 'type')
    cdic = {}
    for i in range(1, 13):
        cdic['c'+str(i)] = []
    with open(os.path.join(__file__, "../../statics/json/class_list.json"), 'r', encoding="utf-8") as f:
        classlist = json.load(f)
        klist = []
        for k, v in classlist['class_list'].items():
            klist.append(k)
        for each in msglist:
            if(each['type'] == klist[0]):
                cdic['c1'].append(each)
            elif(each['type'] == klist[1]):
                cdic['c2'].append(each)
            elif(each['type'] == klist[2]):
                cdic['c3'].append(each)
            elif(each['type'] == klist[3]):
                cdic['c4'].append(each)
            elif(each['type'] == klist[4]):
                cdic['c5'].append(each)
            elif(each['type'] == klist[5]):
                cdic['c6'].append(each)
            elif(each['type'] == klist[6]):
                cdic['c7'].append(each)
            elif(each['type'] == klist[7]):
                cdic['c8'].append(each)
            elif(each['type'] == klist[8]):
                cdic['c9'].append(each)
            elif(each['type'] == klist[9]):
                cdic['c10'].append(each)
            elif(each['type'] == klist[10]):
                cdic['c11'].append(each)
            elif(each['type'] == klist[11]):
                cdic['c12'].append(each)
    with open(os.path.join(__file__, "../../statics/json/website.json"), 'w+', encoding='utf-8') as f:
        data = {}
        for i in range(1, 13):
            id = 0
            x = "classification_" + str(i)
            data[x] = {}
            perlist = random.sample(cdic['c'+str(i)], 54)
            print(perlist)
            for j in range(1, 7):
                y = "tr" + str(j)
                data[x][y] = {}
                for k in range(1, 10):
                    z = "td" + str(k)
                    data[x][y][z] = perlist[id]
                    id += 1
        json.dump(data, f, ensure_ascii=False)
    return HttpResponse('ok')