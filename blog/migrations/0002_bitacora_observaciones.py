# Generated by Django 2.1.5 on 2019-02-14 16:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='bitacora',
            name='observaciones',
            field=models.CharField(default='', max_length=300),
            preserve_default=False,
        ),
    ]
