from django.db import models

# Create your models here.
from django.db import models

class Speciality(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    
    def __str__(self):
        return self.name

class Patient(models.Model):
    full_name = models.CharField(max_length=200)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    age = models.PositiveIntegerField()
    height = models.FloatField()
    weight = models.FloatField()
    special_cases_1 = models.CharField(max_length=100)
    special_cases_2 = models.CharField(max_length=100)
    special_cases_3 = models.CharField(max_length=100)
    picture = models.ImageField(upload_to='patient_pictures/')
    wilaya = models.CharField(max_length=100)
    
    def __str__(self):
        return self.full_name


class Doctors(models.Model):
    full_name = models.CharField(max_length=200)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    speciality = models.ForeignKey(Speciality, on_delete=models.CASCADE)
    location = models.CharField(max_length=200)
    rating = models.DecimalField(max_digits=3, decimal_places=2)
    phone_number = models.CharField(max_length=20)
    description = models.TextField()
    picture = models.ImageField(upload_to='doctor_pictures/')
    gps_location_x = models.FloatField()
    gps_location_y = models.FloatField()
    
    def __str__(self):
        return self.full_name



class Disease(models.Model):
    name = models.CharField(max_length=100)
    speciality = models.ForeignKey(Speciality, on_delete=models.CASCADE)
    def __str__(self):
        return self.name


