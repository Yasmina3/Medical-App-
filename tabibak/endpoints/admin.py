from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(doctor)
admin.site.register(specialty)
admin.site.register(Patient)