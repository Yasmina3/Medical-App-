from django.urls import path
from django.conf import settings
from .views import *
from django.conf.urls.static import static

urlpatterns = [
    path("All_doctors/",all_doctors),
    path("All_specialties/",all_specialties),
    path("register_user/",register_user),
    path("all_users/",get_users),
    path("login/", login_user),
    path("reset_password/", reset_password, name='reset_password'),
    path("verify_otp/", verify_otp, name='verify_otp'), 
    path("chatbot-response/", chatbot_response, name='chatbot_response'),
    path("add_donation/", add_donation, name='add_donation'),
    path("get_donations/", get_donations, name='get_donations'),
    path("take_donation/", take_donation, name='take_donation'),
    path("doctors_per_specialty/",get_specialists),
    path("sessions_per_doctor",get_time_slots_for_doctor),
    path("add_reservation/",add_reservation),
    path("get_reservations_per_patient",get_patient_reservations),
    path("create_new_password/", create_new_password, name='create_new_password'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)