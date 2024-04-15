from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Speciality)
admin.site.register(Patient)
admin.site.register(Doctors)
admin.site.register(Disease)