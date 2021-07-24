from django.db import models


class msg(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20)
    type = models.CharField(max_length=20)
    link = models.CharField(max_length=200)
    icon = models.CharField(max_length=200)
    info = models.TextField()
    time = models.DateField(auto_now=True)