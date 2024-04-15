from django.db import models

# Create your models here.

class doctor(models.Model):
    doctor_id =  models.AutoField(primary_key=True)
    doctor_name = models.TextField()
    doctor_location = models.TextField()
    doctor_speciality = models.TextField()# (only for testing),normally it is a foreign key from Speciality_entity

class specialty(models.Model):
    specialty_id = models.AutoField(primary_key=True)
    specialty_name = models.TextField()


class Patient(models.Model):
    patient_id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=100)
    email = models.EmailField()
    password = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    age = models.IntegerField()
    height = models.IntegerField()
    weight = models.IntegerField()
    special_cases = models.CharField(max_length=100)
    wilaya = models.CharField(max_length=100,default="Algiers")

    def __str__(self):
        return self.full_name

