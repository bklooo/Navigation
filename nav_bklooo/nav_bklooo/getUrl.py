#-*-coding:utf-8-*-

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
import json, os

@csrf_exempt
def get_url(request):
    name = request.POST.get("name")
    classification = request.POST.get("classification")
    tr_id = request.POST.get("tr_id")
    td_id = request.POST.get("td_id")
    
    with open(os.path.join(__file__, '../json/website.json'), encoding='utf-8') as f:
        website = json.load(f)
        if classification is not None and name is not None and tr_id is not None and td_id is not None:
            if name == website[classification][tr_id][td_id]['name']:
                return HttpResponse([website[classification][tr_id][td_id]['url']])

