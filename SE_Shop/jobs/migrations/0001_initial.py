# Generated by Django 4.1.2 on 2023-01-03 05:42

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Jobs",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("jobname", models.CharField(max_length=50)),
                ("link", models.CharField(max_length=255)),
                ("photo", models.CharField(max_length=255)),
                ("icon", models.CharField(max_length=255)),
                ("description", models.CharField(max_length=255)),
            ],
            options={"db_table": "jobs",},
        ),
    ]
