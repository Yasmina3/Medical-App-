from django.http import JsonResponse
from django.shortcuts import render
from .models import *
from django.views.decorators.csrf import csrf_exempt
from django.core.exceptions import ObjectDoesNotExist, ValidationError
from django.core.validators import validate_email

# Create your views here.

def all_doctors(request):
    all_doctors = Doctors.objects.all().values()
    return JsonResponse(list(all_doctors), safe=False)
def all_specialties(request) : 
    all_specs = Specialty.objects.all().values()
    return JsonResponse(list(all_specs), safe=False)
def edit_profile(request, patient_id):
    fields = request.POST
    full_name = fields.get("full_name")
    email = fields.get("email")
    password = fields.get("password")
    
    # full_name = fields["full_name"]
    # email = fields["email"]
    # password = fields["password"]

    try:
        # Retrieve the patient from the database
        patient = Patient.objects.get(patient_id=patient_id)

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

        return JsonResponse({"Response": "Patient profile updated successfully"})
    except ObjectDoesNotExist:
        return JsonResponse({"Error": "Patient not found"}, status=404)
    except KeyError as e:
        return JsonResponse({"Error": f"Missing field: {e}"}, status=400)
        
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

