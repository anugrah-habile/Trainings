from django.shortcuts import render
from django.http import HttpResponse

from .models import Question, Choice


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def index2(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context)

def index3(request):
    latest_choice_list = Choice.objects[:5]
    context = {'latest_choice_list': latest_choice_list}
    return render(request, 'polls/index2.html', context)
 


# Create your views here.
