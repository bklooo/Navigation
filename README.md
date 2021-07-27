# Navigation
### 基于Django开发的导航网页


启动网页：python manage.py runserver 域名:端口<br>
[样式预览](https://bklooo.github.io/Navigation/ "点击前往")

后台地址：域名:端口/admin<br>
默认账号：admin<br>
默认密码：bklooo<br>
在nav_bklooo/setting.json中更改默认设置<br>

#### 导入网站数据有三种办法<br>
##### 方法一
使用我已经准备好的数据库，在database文件夹里有一个nav.bklooo.sql的文件，在mysql中运行sql文件即可导入数据库<br>
默认的数据库信息：<br>
数据库名：nav.bklooo<br>
账号：admin    # 这个不是必须一样的，使用的是你创建数据库时的账号密码，在设置中更改即可<br>
密码：bklooo<br>
可在nav_bklooo/settings.py的DATABASES选项中更改默认设置<br>

##### 方法二
运行爬虫：scrapy crawl navbot_1 -O website.csv即可得到最新的网页数据，然后将csv文件导入到数据库中即可更新网站数据，在数据库中需要自行设置网站分类<br>
运行爬虫需要安装scrapy，且测试使用的是2.4版本，请尽量保持版本一致，运行命令：pip install scrapy==2.4（如若安装失败，可以到官网下载安装，需要提前准备好环境和依赖）<br>

##### 方法三
如果你是自己创建的数据库，需要做以下操作<br>
找到manage.py所在的目录，运行：<br>
$ python3 manage.py migrate   # 创建django表结构<br>
$ python3 manage.py makemigrations Navigation  # 提交模型（模型文件在Navigation/models.py中）<br>
$ python3 manage.py migrate Navigation   # 向数据库推送表结构<br>
<br>
然后就能在数据库中看到navigation_msg的表，字段为：<br>
id（自动分配）<br>
name（网站名）<br>
type（网站类型）<br>
link（网址链接）<br>
info（描述信息）<br>
time（添加时间）<br>
之后就能在数据库中添加你自己的数据了<br>
