#-*-coding:utf-8-*-

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
import json, os

@csrf_exempt
def get_url(request):
    name = request.POST.get("name")
    classification = request.POST.get("classification")
    w_id = request.POST.get("w_id")
    
    with open(os.path.join(__file__, '../json/website.json'), encoding='utf-8') as f:
        website = json.load(f)
        if classification is not None and w_id is not None and name is not None:
            if name == website[classification][w_id]['name']:
                return HttpResponse([website[classification][w_id]['url']])


