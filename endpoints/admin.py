from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Specialty)
admin.site.register(Patient)
admin.site.register(Disease)
admin.site.register(Doctors)