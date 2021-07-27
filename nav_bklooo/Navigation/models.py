from django.db import models


class msg(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20)
    type = models.CharField(max_length=20, null=True, default='')
    link = models.CharField(max_length=200)
    icon = models.CharField(max_length=200, null=True, default='')
    info = models.TextField(null=True, default='')
    time = models.DateField(auto_now=True)