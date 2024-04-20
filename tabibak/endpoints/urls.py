from django.urls import path,include
from .views import *

urlpatterns = [
    path("logout/",logout),
    path("All_doctors/",all_doctors),
    path("All_specialties/",all_specialties),
    path("register_user/",register_user),
    path("all_users/",get_users),
]