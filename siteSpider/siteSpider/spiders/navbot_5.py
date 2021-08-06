import scrapy
from siteSpider.items import SitespiderItem
from urllib.parse import urljoin
import datetime
import re


class Navbot5Spider(scrapy.Spider):
    name = 'navbot_5'
    start_urls = ['https://top.chinaz.com/hangye/index_yule_shipindianying.html/']

    def parse(self, response):
        item = SitespiderItem()
        if(response.status == 200):
            for i in response.xpath('//*[@id="content"]/div[4]/div[3]/div[2]/ul/li'):
                item['name'] = i.xpath('div[2]/h3/a/text()').get()
                item['link'] = "http://" + i.xpath('div[2]/h3/span/text()').get()
                print(item)
                yield scrapy.Request(item['link'], callback=self.get_msg, cb_kwargs=dict(name=item['name'], link=item['link']))
            next_page = urljoin('https://top.chinaz.com/hangye/index_jiaotonglvyou_lvyou.html/', response.xpath('//*[@id="content"]/div[4]/div[3]/div[2]/div[2]/a[11]/@href').get())
            yield scrapy.Request(next_page, callback=self.parse)

    def get_msg(self, response, name, link):
        item = SitespiderItem()
        if(response.status == 200):
            item['name'] = name
            item['type'] = "影视视频"
            item['link'] = link
            icon_url = response.xpath("//link[@rel='icon']/@href | //link[@rel='shortcut icon']/@href").get()
            if(icon_url):
                pattern1 = re.compile(r'[.]+')
                pattern2 = re.compile(r'[/]+')
                pattern3 = re.compile(r'[^./(http)]+')
                if(pattern1.match(icon_url)):
                    item['icon'] = urljoin(response.url, icon_url)
                elif(pattern2.match(icon_url)):
                    if(pattern2.match(icon_url).span()[1] == 1):
                        item['icon'] = urljoin(response.url, icon_url)
                    else:
                        item['icon'] = icon_url
                elif(pattern3.match(icon_url)):
                    item['icon'] = urljoin(response.url, icon_url)
                else:
                    item['icon'] = icon_url
            else:
                item['icon'] = ""
            info = response.xpath("//meta[@name='description']/@content").get()
            if(info):
                item['info'] = info
            else:
                item['info'] = ""
            item['time'] = datetime.datetime.now().strftime('%Y-%m-%d')
            yield item
        else:
            print("error")