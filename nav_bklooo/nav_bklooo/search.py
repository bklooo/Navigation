from django.shortcuts import render


def searchAll(request):
    request.encoding = 'utf-8'
    if 's' in request.GET and request.GET['s']:
        message = 'hello'
    else:
        message = 'bay'
    return render(request, 's_result.html', {"message": message})