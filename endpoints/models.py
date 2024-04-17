from django.db import models

# Create your models here.


class Specialty(models.Model):
    spec_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField()
    
    def __str__(self):
        return self.name




class Disease(models.Model):
    Disease_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    speciality = models.ForeignKey(Specialty, on_delete=models.CASCADE)
    def __str__(self):
        return self.name
    
class Doctors(models.Model):
    Doctor_id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=200)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    speciality = models.ForeignKey(Specialty, on_delete=models.CASCADE)
    location = models.CharField(max_length=200)
    rating = models.DecimalField(max_digits=3, decimal_places=2)
    phone_number = models.CharField(max_length=20)
    description = models.TextField()
  #  picture = models.ImageField(upload_to='doctor_pictures/')
    gps_location_x = models.FloatField()
    gps_location_y = models.FloatField()
    
    def __str__(self):
        return self.full_name




class Patient(models.Model):
    patient_id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    otp = models.CharField(max_length=6, null=True, blank=True)
    gender = models.CharField(max_length=10)
    age = models.IntegerField()
    height = models.IntegerField()
    weight = models.IntegerField()
    special_cases = models.CharField(max_length=100)
    wilaya = models.CharField(max_length=100,default="Algiers")

    def __str__(self):
        return self.full_name