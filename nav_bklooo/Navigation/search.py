from django.shortcuts import render
from django.http import HttpResponse
from Navigation.models import msg


def searchAll(request):
    request.encoding = 'utf-8'
    if request.GET['s']:
        s = request.GET['s']

        return HttpResponse(s)

    else:
        message = 'bay'
        return render(request, 's_result.html', {"message": message})