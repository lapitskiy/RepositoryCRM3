# Generated by Django 3.1.6 on 2021-02-12 12:55

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('plugins', '0005_plugins_apps_install_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='plugins',
            name='apps_install_name',
        ),
    ]