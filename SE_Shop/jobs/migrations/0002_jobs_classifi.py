# Generated by Django 4.1.2 on 2023-01-03 06:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("jobs", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="jobs",
            name="Classifi",
            field=models.CharField(default=1, max_length=50),
            preserve_default=False,
        ),
    ]
