from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Patient)
admin.site.register(Disease)
admin.site.register(Doctors)
admin.site.register(Donation)
admin.site.register(Reservation)
admin.site.register(Sessions)
@admin.register(Specialty)
class SpecialtyAdmin(admin.ModelAdmin):
    list_display = ['spec_id', 'name', 'description']