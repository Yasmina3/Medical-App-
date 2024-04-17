from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password
from django.core.mail import send_mail
from django.conf import settings
import random
from .models import *

# Create your views here.

def all_doctors(request):
    all_doctors = Doctors.objects.all().values()
    return JsonResponse(list(all_doctors), safe=False)
def all_specialties(request) : 
    all_specs = Specialty.objects.all().values()
    return JsonResponse(list(all_specs), safe=False)

@csrf_exempt
def login_user(request):
    if request.method == 'POST':
        try:
            data = request.POST
            email = data.get('email')
            password = data.get('password')

            # Check if email and password are provided
            if not email or not password:
                response = {'success': False, 'message': 'Email and password are required'}
                return JsonResponse(response)

            # Query the user by email
            try:
                user = Patient.objects.get(email=email)
            except Patient.DoesNotExist:
                # User not found
                response = {'success': False, 'message': 'User not found'}
                return JsonResponse(response)

            # Check the password
            if password == user.password:
                # Password is correct
                creds = {
                    "id": user.patient_id,
                    "email": user.email,
                    "full_name": user.full_name,
                    "gender": user.gender,
                    "age": user.age,
                    "height": user.height,
                    "weight": user.weight,
                    "wilaya": user.wilaya,
                }
                response = {'success': True, 'message': 'Login successful', 'credentials': creds}
                return JsonResponse(response)
            else:
                # Incorrect password
                response = {'success': False, 'message': 'Incorrect password'}
                return JsonResponse(response)

        except Exception as e:
            # Login failed
            response = {'success': False, 'message': f'Login failed: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)

@csrf_exempt
def reset_password(request):
    if request.method == 'POST':
        try:
            data = request.POST
            email = data.get('email')  # Ensure the field name matches

            # Check if email is provided
            if not email:
                response = {'success': False, 'message': 'Email is required'}
                return JsonResponse(response)

            # Query the user by email
            try:
                user = Patient.objects.get(email=email)
            except Patient.DoesNotExist:
                # User not found
                response = {'success': False, 'message': 'User not found'}
                return JsonResponse(response)

            # Generate OTP
            otp = ''.join(random.choices('0123456789', k=6))

            # Save the OTP to the user's record (you may need to add a field for OTP in your model)
            user.otp = otp
            user.save()

            # Send the OTP to the user's email
            send_mail(
                'OTP for Password Reset',
                f'Your OTP is: {otp}',
                'settings.EMAIL_HOST_USER',
                [user.email],
                fail_silently=False,
            )

            response = {'success': True, 'message': 'OTP sent to your email'}
            return JsonResponse(response)

        except Exception as e:
            # Error handling
            response = {'success': False, 'message': f'Error: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)
    
@csrf_exempt
def verify_otp(request):
    if request.method == 'POST':
        try:
            data = request.POST
            email = data.get('email')
            otp = data.get('otp')

            # Query the user by email
            try:
                user = Patient.objects.get(email=email)
            except Patient.DoesNotExist:
                # User not found
                response = {'success': False, 'message': 'User not found'}
                return JsonResponse(response)

            # Verify OTP
            if user.otp == otp:
                # OTP is correct
                response = {'success': True, 'message': 'OTP verified successfully'}
                return JsonResponse(response)
            else:
                # OTP is incorrect
                response = {'success': False, 'message': 'Incorrect OTP'}
                return JsonResponse(response)

        except Exception as e:
            # Error handling
            response = {'success': False, 'message': f'Error: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)
    
@csrf_exempt
def register_user(request):
    fields = request.POST
    full_name = fields["full_name"]
    email = fields["email"]
    password = fields["password"]
    gender = fields["gender"]
    age = fields["age"]
    height = fields["height"]
    weight = fields['weight']
    specs = fields["specs"]
    wilaya = fields["wilaya"]
    patient = Patient(
        full_name = full_name,
        email = email,
        password = password,
        gender = gender,
        age = age,
        height = height,
        weight = weight,
        special_cases = specs,
        wilaya = wilaya,)
    print("patient added succesfully")

    patient.save()

    return JsonResponse({"Response" : "Patient added succesfully"})


    


    print(f"fields={fields}")


    return JsonResponse(list(fields),safe=False)

def get_users(request):
    all_patients = Patient.objects.all().values()
    return JsonResponse(list(all_patients), safe=False)

