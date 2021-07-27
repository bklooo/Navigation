from scrapy.http import request
from siteSpider.items import SitespiderItem
import scrapy
import re
import datetime


class NavbotSpider(scrapy.Spider):
    name = 'navbot_1'
    start_urls = ['https://touduyu.com/']

    def parse(self, response):
        for i in response.xpath("//*[@id=\"index\"]/body/main/div[3]/div[2]/div"):
            for j in i.xpath("ul/li"):
                item = SitespiderItem()
                pattern = re.compile(r'^https?://([^.]+\.)?[^:/.]+\.[^:/.?]+[/]?')
                searchObj = pattern.search(j.xpath("a/@href").extract()[0])
                item['link'] = searchObj.group()
                item['name'] = j.xpath("a/div/h4/text()").extract()[0]
                yield scrapy.Request(item['link'], callback=self.get_msg, meta=item)

    def get_msg(self, response):
            item = SitespiderItem()
            if(response.status == 200):
                item['name'] = response.meta['name']
                item['link'] = response.meta['link']
                icon_url = response.xpath("//link[@rel='icon']/@href | //link[@rel='shortcut icon']/@href").get()
                if(icon_url):
                    pattern1 = re.compile(r'[.]+')
                    pattern2 = re.compile(r'[/]+')
                    if(pattern1.match(icon_url)):
                        item['icon'] = response.meta['link'] + icon_url
                    elif(pattern2.match(icon_url)):
                        if(pattern2.match(icon_url).span()[1] == 1):
                            item['icon'] = response.meta['link'] + "." + icon_url
                        else:
                            item['icon'] = icon_url
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
