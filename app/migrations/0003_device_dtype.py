# Generated by Django 2.0.6 on 2018-06-26 11:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_auto_20180626_1758'),
    ]

    operations = [
        migrations.AddField(
            model_name='device',
            name='dtype',
            field=models.CharField(default='会议室', max_length=10),
        ),
    ]
