from siteSpider.items import SitespiderItem
import scrapy
import re


class NavbotSpider(scrapy.Spider):
    name = 'navbot'
    start_urls = ['http://touduyu.com/']

    def parse(self, response):
        items = []
        for i in response.xpath("//*[@id=\"index\"]/body/main/div[3]/div[2]/div"):
            for j in i.xpath("ul/li"):
                item = SitespiderItem()
                pattern = re.compile(r'^https?://([^.]+\.)?[^:/.]+\.[^:/.?]+[/]?')
                searchObj = pattern.search(j.xpath("a/@href").extract()[0])
                item['link'] = searchObj.group()
                item['name'] = j.xpath("a/div/h4/text()").extract()[0]
                items.append(item)
        return items