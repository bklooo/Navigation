"""nav_bklooo URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import testdb, views, getUrl, search, return_web_name

# 所有的网页路径
urlpatterns = [
    path('admin/', admin.site.urls),
    path('testdb/', testdb.testdb),
    path('', views.index),
    path('geturl/', getUrl.get_url),
    path('search/', search.searchAll),
    path('sitename/', return_web_name.getWebName),
]