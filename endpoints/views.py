from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password
from django.core.mail import send_mail
from django.conf import settings
import random
from django.db.models import Q
from .models import *
from django.contrib.auth.hashers import check_password  # Import the password checking function
from django.core.exceptions import ObjectDoesNotExist, ValidationError
from django.core.validators import validate_email

# Create your views here.

def all_doctors(request):
    all_doctors = Doctors.objects.all().values()
    return JsonResponse(list(all_doctors), safe=False)
def all_specialties(request) : 
    all_specs = Specialty.objects.all().values()
    return JsonResponse(list(all_specs), safe=False)


def get_doctor_info(request, doctor_id):
    try:
        doctor_info = Doctors.objects.filter(Doctor_id=doctor_id).values().first()
        if doctor_info:
            return JsonResponse(doctor_info)
        else:
            return JsonResponse({'error': 'Doctor not found'}, status=404)
    except ValueError:
        return JsonResponse({'error': 'Invalid doctor ID'}, status=400)


@csrf_exempt
def login_user(request):
    print('hello')
    if request.method == 'POST':
        try:
            data = request.POST
            email = data.get('email')
            password = data.get('password')

            # Check if email and password are provided
            if not email or not password:
                response = {'success': False, 'message': 'البريد الإلكتروني وكلمة المرور مطلوبة'}
                return JsonResponse(response)
            print('hello')
            # Query the user by email
            try:
                print('hello')
                user = Patient.objects.get(email=email)
                print('hello')
            except Patient.DoesNotExist:
                # User not found
                print('hello')
                response = {'success': False, 'message': 'المستخدم غير موجود'}
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
                response = {'success': True, 'message': 'تم تسجيل الدخول بنجاح', 'credentials': creds}
                return JsonResponse(response)
            else:
                # Incorrect password
                response = {'success': False, 'message': 'كلمة المرور غير صحيحة'}
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
def edit_profile(request, patient_id):
    fields = request.POST
    full_name = fields['full_name']
    email = fields['email']
    password = fields['password']
    
    try:
        # Retrieve the patient from the database
        patient = Patient.objects.get(patient_id=patient_id)
        print(patient.patient_id)
        # Verify the password
        if password != patient.password:
            return JsonResponse({"Error": "Incorrect password provided"}, status=403)

        # Validate email format
        if email:
            try:
                validate_email(email)   
            except ValidationError:
                return JsonResponse({"Error": "Invalid email format"}, status=400)

        # Update the patient's information
        if full_name:
            patient.full_name = full_name
        if email:
            patient.email = email
        # You can add more fields to update as needed

        # Save the changes
        patient.save()
        print('saved')
        return JsonResponse({"Response": "Patient profile updated successfully"})
    except ObjectDoesNotExist:
        return JsonResponse({"Error": "Patient not found"}, status=404)
    except KeyError as e:
        return JsonResponse({"Error": f"Missing field: {e}"}, status=400)
        
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

from django.http import JsonResponse
from .models import Doctors

def get_top_doctors(request):
    top_doctors = Doctors.objects.select_related('speciality').order_by('-rating')[:10]
    doctors = []
    for doc in top_doctors:
        doctor_info = {
            'Doctor_id': doc.Doctor_id,
            'full_name': doc.full_name,
            'email': doc.email,
            'password': doc.password,
            'speciality': doc.speciality_id,
            'speciality_name': doc.speciality.name if doc.speciality else "Unknown",
            'location': doc.location,
            'gender': doc.gender,
            'rating': str(doc.rating),
            'phone_number': doc.phone_number,
            'description': doc.description,
            'gps_location_x': str(doc.gps_location_x),
            'gps_location_y': str(doc.gps_location_y),
        }
        doctors.append(doctor_info)
    return JsonResponse(doctors, safe=False)


def search_doctors(request):
    query = request.GET.get('query', '')
    print(f"Query received: '{query}'")  # Debug output
    if query:
        doctors = Doctors.objects.filter(
            Q(full_name__icontains=query) | 
            Q(email__icontains=query) |
            Q(speciality__name__icontains=query) |
            Q(location__icontains=query) |
            Q(phone_number__icontains=query) |
            Q(description__icontains=query)
        ).values(
            'Doctor_id', 'full_name', 'email', 'speciality__name', 'location', 
            'rating', 'phone_number', 'description', 'gps_location_x', 'gps_location_y'
        )
        return JsonResponse(list(doctors), safe=False)
    else:
        return JsonResponse({'message': 'No query provided'}, status=400)
