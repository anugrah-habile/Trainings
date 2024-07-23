from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("questions/", views.index2, name= "index2"),
    path("choices/", views.index3, name = "index3")
]