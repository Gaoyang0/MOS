# Generated by Django 2.0.6 on 2018-07-02 02:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_auto_20180702_0906'),
    ]

    operations = [
        migrations.AddField(
            model_name='seat',
            name='stype',
            field=models.CharField(default='', max_length=10),
            preserve_default=False,
        ),
    ]