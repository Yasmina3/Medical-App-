# Generated by Django 5.0 on 2024-04-24 15:07

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("endpoints", "0010_patient_points"),
    ]

    operations = [
        migrations.AddField(
            model_name="donation",
            name="title",
            field=models.TextField(default="chaise roulante"),
            preserve_default=False,
        ),
    ]
