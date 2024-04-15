from django.http import JsonResponse
from django.shortcuts import render
from .models import *

# Create your views here.

def all_doctors(request):
    all_doctors = Doctors.objects.all().values()
    return JsonResponse(list(all_doctors), safe=False)
def all_specialties(request) : 
    all_specs = Speciality.objects.all().values()
    return JsonResponse(list(all_specs), safe=False)
