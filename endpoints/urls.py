from django.urls import path,include
from .views import *

urlpatterns = [
    path("All_doctors/",all_doctors),
    path("Top_doctors/",get_top_doctors),
    path("All_specialties/",all_specialties),
    path("edit_profile/",edit_profile),
    path("register_user/",register_user),
    path("all_users/",get_users),
    path("login/",login_user),
    path("get_doctor/<int:doctor_id>/",get_doctor_info),
    path("reset_password/",reset_password, name='reset_password'),
    path("verify_otp/",verify_otp, name='verify_otp'), 
    path("search/doctors/",search_doctors),
    path("getUserInfo/",get_user_info),
]
