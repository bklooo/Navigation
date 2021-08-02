from siteSpider.items import SitespiderItem
import scrapy
import json
import datetime
import re


class NavbotSpider(scrapy.Spider):
    name = 'navbot_2'
    start_urls = ['https://xydh.fun/api/v1/allsiteandlinks/admin']

    def parse(self, response):
        item = SitespiderItem()
        if(response.status == 200):
            sitedic = json.loads(response.text)
            for i in sitedic['data']['folderwith_links']:
                for j in i['links']:
                    item['name'] = j['name']
                    item['link'] = j['url']
                    yield scrapy.Request(item['link'], callback=self.get_msg, cb_kwargs=dict(name=item['name'], link=item['link']))
    
    def get_msg(self, response, name, link):
        item = SitespiderItem()
        if(response.status == 200):
            item['name'] = name
            item['link'] = link
            icon_url = response.xpath("//link[@rel='icon']/@href | //link[@rel='shortcut icon']/@href").get()
            if(icon_url):
                pattern1 = re.compile(r'[.]+')
                pattern2 = re.compile(r'[/]+')
                pattern3 = re.compile(r'[\w]+')
                if(pattern1.match(icon_url)):
                    item['icon'] = item['link'] + icon_url
                elif(pattern2.match(icon_url)):
                    if(pattern2.match(icon_url).span()[1] == 1):
                        if(item['link'][-1] == "/"):
                            item['icon'] = item['link'] + "." + icon_url
                        else:
                            item['icon'] = item['link'] + "/." + icon_url
                    else:
                        item['icon'] = icon_url
                elif(pattern3.match(icon_url)):
                    if(item['link'][-1] == "/"):
                        item['icon'] = item['link'] + icon_url
                    else:
                        item['icon'] = item['link'] + "/" + icon_url
                else:
                    item['icon'] = icon_url
            else:
                item['icon'] = ""
            info = response.xpath("//meta[@name='description']/@content").extract()
            if(info):
                item['info'] = info[0]
            else:
                item['info'] = ""
            item['time'] = datetime.datetime.now().strftime('%Y-%m-%d')
            yield item
        else:
            print("error")