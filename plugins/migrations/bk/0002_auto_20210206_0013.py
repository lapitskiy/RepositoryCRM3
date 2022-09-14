# Generated by Django 3.1.6 on 2021-02-05 21:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plugins', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='plugins',
            name='photo',
            field=models.ImageField(blank=True, upload_to='photos/plugin/%Y/%m/%d/', verbose_name='Фото'),
        ),
        migrations.AddField(
            model_name='plugins',
            name='zipfile',
            field=models.FileField(blank=True, upload_to='file/%Y/%m/%d', verbose_name='Файл'),
        ),
    ]