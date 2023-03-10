# Generated by Django 3.2.12 on 2023-01-22 13:49

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='C_emploi',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('telephone', models.CharField(max_length=10)),
                ('image', models.ImageField(upload_to='')),
                ('sexe', models.CharField(max_length=10)),
                ('type', models.CharField(max_length=15)),
                ('description', models.TextField(default='', editable=False, max_length=400)),
                ('experience', models.CharField(default='', editable=False, max_length=100)),
                ('adresse', models.CharField(default='', editable=False, max_length=100)),
                ('skills', models.CharField(default='', editable=False, max_length=200)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Entreprise',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('telephone', models.CharField(max_length=10)),
                ('image', models.ImageField(upload_to='')),
                ('sexe', models.CharField(max_length=10)),
                ('type', models.CharField(max_length=15)),
                ('status', models.CharField(max_length=20)),
                ('nom_entreprise', models.CharField(max_length=100)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Langue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(default='', editable=False, max_length=100)),
                ('description', models.TextField(default='', editable=False, max_length=400)),
            ],
        ),
        migrations.CreateModel(
            name='Visiteur',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Travail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_debut', models.DateField()),
                ('date_fin', models.DateField()),
                ('titre', models.CharField(max_length=200)),
                ('salaire', models.FloatField()),
                ('image', models.ImageField(upload_to='')),
                ('description', models.TextField(max_length=400)),
                ('experience', models.CharField(max_length=100)),
                ('adresse', models.CharField(max_length=100)),
                ('skills', models.CharField(max_length=200)),
                ('date_creation', models.DateField()),
                ('entreprise', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.entreprise')),
            ],
        ),
        migrations.CreateModel(
            name='Notes',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('note', models.IntegerField()),
                ('c_emploi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.c_emploi')),
                ('visiteur', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.visiteur')),
            ],
        ),
        migrations.CreateModel(
            name='LangueMaitrise',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('c_emploi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.c_emploi')),
                ('langue', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='myappdjf.langue')),
            ],
        ),
        migrations.CreateModel(
            name='Deposer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('entreprise', models.CharField(default='', max_length=200)),
                ('cv', models.ImageField(upload_to='')),
                ('date_depot', models.DateField()),
                ('c_emploi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.c_emploi')),
                ('travail', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.travail')),
            ],
        ),
    ]
