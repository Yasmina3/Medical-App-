# Generated by Django 5.0 on 2024-04-17 17:53

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("endpoints", "0007_disease_doctors_delete_doctor_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="patient",
            name="otp",
            field=models.CharField(blank=True, max_length=6, null=True),
        ),
    ]
