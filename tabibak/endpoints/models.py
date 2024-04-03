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
