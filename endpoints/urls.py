from django.urls import path,include
from .views import *

urlpatterns = [
    path("All_doctors/",all_doctors),
    path("All_specialties/",all_specialties),
    path("register_user/",register_user),
    path("all_users/",get_users),
    path("login/", login_user),
    path("reset_password/", reset_password, name='reset_password'),
    path("verify_otp/", verify_otp, name='verify_otp'), 
    path("search/doctors/", search_doctors),
    path("edit_profile/<int:patient_id>/",edit_profile),
]
