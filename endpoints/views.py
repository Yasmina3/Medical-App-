from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password
from django.core.mail import send_mail
from django.conf import settings
from django.utils import timezone
import random
import json
import requests
from .models import *
import http.client
from .translation_utils import translate_text


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
            otp = ''.join(random.choices('0123456789', k=4))

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
def create_new_password(request):
    if request.method == 'POST':
        try:
            data = request.POST
            email = data.get('email')
            new_password = data.get('new_password')

            # Query the user by email
            try:
                user = Patient.objects.get(email=email)
            except Patient.DoesNotExist:
                # User not found
                response = {'success': False, 'message': 'User not found'}
                return JsonResponse(response)

            # Set new password
            user.password = new_password
            user.save()

            response = {'success': True, 'message': 'Password updated successfully'}
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

MODEL_ENDPOINT = 'http://127.0.0.1:5004/execute_final_result/'

@csrf_exempt
def chatbot_response(request):
    if request.method == 'POST':
        try:
            # Get the message from the request
            data = json.loads(request.body)
            user_message = data.get('message')
            print(user_message)

            # Translate the user message from Arabic to English
            translated_message = translate_text(user_message, src='ar', dest='en')
            print(f"Translated user message to English: {translated_message}")
            
            # Forward the translated message to your model for processing
            bot_response_english = forward_to_model(translated_message)
            print(f"Model response in English: {bot_response_english}")
            
            # Translate the bot response from English to Arabic
            bot_response_arabic = translate_text(bot_response_english, src='en', dest='ar')
            print(f"Translated bot response to Arabic: {bot_response_arabic}")
            
            # Return the bot response in Arabic
            return JsonResponse({'response': bot_response_arabic})
        
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON format'}, status=400)
        
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)

def forward_to_model(query):
    try:
        print(f"Forwarding message to model: {query}")
        
        # Define headers
        headers = {'Content-type': 'application/json'}
        
        # Define the payload
        payload = json.dumps({'message': query})
        
        # Send POST request to the model's chatbot response endpoint
        response = requests.post(MODEL_ENDPOINT, data=payload, headers=headers)
        
        if response.status_code == 200:
            response_data = response.json()
            return response_data.get('response', 'Unknown response from model')
        else:
            return f"Failed to get response from model: {response.status_code} {response.reason}"
        
    except Exception as e:
        print(f"An error occurred while forwarding to model: {e}")
        return f"An error occurred while forwarding to model: {e}"

@csrf_exempt
def add_donation(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)  # Parse JSON data
            description = data.get('description')
            title = data.get('title')
            image = data.get('image')
            wilaya = data.get('wilaya')
            phone_number = data.get('phoneNumber')
            patientId = data.get('patientId')

            # Convert patientId to integer
            patientId = int(patientId)

            # Create a new donation post
            donation = Donation.objects.create(
                patient_id=patientId,
                description=description,
                title=title,
                image=image,
                phone_number=phone_number,
                wilaya=wilaya,
                available=True
            )

            # Return success response
            response = {'success': True, 'message': 'Donation post added successfully'}
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
def get_donations(request):
    if request.method == 'GET':
        try:
            # Get all donations
            donations = Donation.objects.filter(available=True).values()

            # Construct full image URL for each donation object
            for donation in donations:
                image_url = settings.MEDIA_URL  + donation['image']
                donation['image'] = request.build_absolute_uri(image_url)
                print(donation)

            return JsonResponse(list(donations), safe=False)

        except Exception as e:
            # Error handling
            response = {'success': False, 'message': f'Error: {str(e)}'}
            return JsonResponse(response)

    else:
        # Invalid request method
        response = {'success': False, 'message': 'Invalid request method'}
        return JsonResponse(response)




@csrf_exempt
def take_donation(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            donation_id = data.get('donation_id')
            patient_id = data.get('patient_id')

            # Get the donation object
            donation = Donation.objects.get(id=donation_id)

            # Update the donation availability and assign it to the patient
            if donation.available:
                donation.available = False
                donation.save()

                # Increase the poster's points
                poster = Patient.objects.get(patient_id=donation.patient_id)
                poster.points += 1  # Increase by 1 point
                poster.save()

                response = {'success': True, 'message': 'Donation taken successfully'}
                return JsonResponse(response)
            else:
                response = {'success': False, 'message': 'Donation not available'}
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
def get_patient_name_by_id(request):
    if request.method == 'GET':
        patient_id = request.GET.get('id', None)
        
        if not patient_id:
            return JsonResponse({'success': False, 'message': 'Patient ID is required'})

        try:
            patient = Patient.objects.get(id=patient_id)
            return JsonResponse({'success': True, 'name': patient.name})
        except Patient.DoesNotExist:
            return JsonResponse({'success': False, 'message': 'Patient not found'})

    return JsonResponse({'success': False, 'message': 'Invalid request method'})

@csrf_exempt
def add_points_to_patient(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))
        patient_id = data.get('id', None)
        points = data.get('points', None)
        
        if not patient_id or not points:
            return JsonResponse({'success': False, 'message': 'Patient ID and points are required'})

        try:
            patient = Patient.objects.get(id=patient_id)
            patient.points += points
            patient.save()
            
            return JsonResponse({'success': True, 'message': 'Points added successfully'})
        except Patient.DoesNotExist:
            return JsonResponse({'success': False, 'message': 'Patient not found'})

    return JsonResponse({'success': False, 'message': 'Invalid request method'})

def get_specialists(request):
    spec_id = request.GET.get("spec_id")
    
    # Retrieve specialty name
    specialty_name = Specialty.objects.filter(spec_id=spec_id).values_list("name", flat=True).first()

    if specialty_name is None:
        return JsonResponse({"error": "Specialty not found"}, status=404)

    # Retrieve doctors with the given specialty
    spec_doctors = Doctors.objects.filter(speciality=spec_id).values()

    # Add specialty_name to each doctor dictionary
    for doctor in spec_doctors:
        doctor["specialty_name"] = specialty_name

    return JsonResponse(list(spec_doctors), safe=False)


def get_time_slots_for_doctor(request):
    doctor_id = request.GET.get("doctor_id")
    
    # Get doctor's information
    doctor_infos = list(Doctors.objects.filter(Doctor_id=doctor_id).values())
    
    # Get current date and time
    current_datetime = timezone.now()

    # Fetch specialty name for the doctor
    doctor_specialty_id = doctor_infos[0]["speciality_id"]
    specialty_name = Specialty.objects.filter(spec_id=doctor_specialty_id).values("name").first()["name"]
    
    # Retrieve all sessions for the doctor with the provided doctor_id
    sessions = list(Sessions.objects.filter(doctor_id=doctor_id, session_time__gte=current_datetime).values())
    
    # Add specialty_name to doctor_infos
    doctor_infos[0]["specialty_name"] = specialty_name
    
    # Create a dictionary containing both doctor's information and session list
    response_data = {
        'doctor_info': doctor_infos,
        'session_list': sessions
    }
    
    # Return the combined data as JSON response
    return JsonResponse(response_data)
@csrf_exempt
def add_reservation(request):
    if request.method == 'POST':
        # Get session ID and patient ID from request.POST
        session_id = request.POST.get('session_id')
        patient_id = request.POST.get('patient_id')
        
        # Get Sessions instance for the session to reserve
        session = Sessions.objects.get(session_id=session_id)
        
        # Update session state to "reserved"
        session.state = 'requested'
        session.save()

        patient = Patient.objects.get(patient_id=patient_id)

        # Create reservation
        reservation = Reservation.objects.create(
            session_id=session,
            patient_id=patient,
            state='requested'  # Set reservation state to "reserved"
        )
    return JsonResponse({'success': True, 'reservation_id': reservation.reservation_id})
                





def get_patient_reservations(request):
    patient_id = request.GET.get('patient_id')
    try:
        # Query all reservations for the specified patient ID
        reservations = Reservation.objects.filter(patient_id=patient_id)

        # Serialize reservations data if needed
        reservations_data = []
        for reservation in reservations:
            data = {
                'reservation_id': reservation.reservation_id,
                'session_id': reservation.session_id.session_id,
                'doctor_name': reservation.session_id.doctor_id.full_name,
                'session_time': reservation.session_id.session_time.strftime('%Y-%m-%d %H:%M:%S'),
                'state': reservation.state
            }
            reservations_data.append(data)

        # Return JSON response with reservations data
        return JsonResponse({'success': True, 'reservations': reservations_data})
    except Exception as e:
        # Handle any exceptions and return error response
        return JsonResponse({'success': False, 'message': str(e)})