# Navigation
### 基于Django开发的导航网页


启动网页：python manage.py runserver 域名:端口<br>
[样式预览](https://bklooo.github.io/Navigation/ "点击前往")

后台地址：域名:端口/admin<br>
默认账号：admin<br>
默认密码：bklooo<br>
在nav_bklooo/setting.json中更改默认设置<br>

运行爬虫：scrapy crawl navbot -o website.json即可得到最新的网页数据，然后将json文件导入到数据库中即可更新网站数据，在数据库中可设置网站分类<br>
<br>
默认的数据库信息：<br>
账号：admin<br>
密码：bklooo<br>
可在nav_bklooo/settings.py的DATABASES选项中更改默认设置<br>
连接数据库后需要做以下操作：<br>
$ python3 manage.py migrate   # 创建表结构<br>
$ python3 manage.py makemigrations Navigation  # 让 Django 知道我们在我们的模型有一些变更<br>
$ python3 manage.py migrate Navigation   # 创建表结构<br>
<br>
然后就能在数据库中看到navigation_msg的表，字段为：<br>
id（自动分配）<br>
name（网站名）<br>
type（网站类型）<br>
link（网址链接）<br>
info（描述信息）<br>
time（添加时间）<br>
