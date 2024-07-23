from django.db import models


class student(models.Model):
    name = models.CharField(max_length=200)
    attendance = models.IntegerField(max_length=200)
    date_of_birth = models.IntegerField(max_length=200)
    phone_number = models.CharField(max_length=20)
    def __str__(self):
        return self.name

class teacher(models.Model):
    name = models.CharField(max_length=200)
    date_of_birth = models.IntegerField(max_length=200)
    phone_number = models.CharField(max_length=20)
    def __str__(self):
        return self.name

   






# Create your models here.
