# Generated by Django 3.2.12 on 2023-02-10 17:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myappdjf', '0005_documents'),
    ]

    operations = [
        migrations.CreateModel(
            name='Document',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('intitule', models.CharField(max_length=20)),
                ('cv', models.FileField(upload_to='')),
                ('date_depot', models.DateTimeField(auto_now_add=True)),
                ('c_emploi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='myappdjf.c_emploi')),
            ],
        ),
        migrations.DeleteModel(
            name='Documents',
        ),
    ]
