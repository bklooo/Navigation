from django.urls import re_path
from . import getUrl, search, return_web_name, more

# 所有的网页路径
urlpatterns = [
    re_path(r'geturl/', getUrl.get_url),
    re_path(r'search/', search.searchAll),
    re_path(r'sitename/', return_web_name.getWebName),
    re_path(r'ransite/', getUrl.get_ran_site),
    re_path(r'more/', more.more),
]
