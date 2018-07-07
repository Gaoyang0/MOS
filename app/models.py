from django.db import models

# Create your models here.


# 人员表
class User(models.Model):
    class Meta:
        db_table = "user_"
    uno = models.CharField(max_length=7, primary_key=True)
    uname = models.CharField(max_length=32, null=False)
    upic = models.CharField(max_length=64, default='/static/data/huaji.png', null=False)
    sex = models.CharField(max_length=3, null=False)
    idnum = models.CharField(max_length=18, null=False)
    duty = models.CharField(max_length=10, null=False)
    department = models.CharField(max_length=10, null=False)
    post = models.CharField(max_length=10, null=False)
    companymail = models.EmailField(null=False)
    personalmail = models.EmailField(null=False)
    housephone = models.CharField(max_length=20, null=False)
    tel = models.CharField(max_length=20, null=False)
    phone = models.CharField(max_length=20, null=False)
    ustate = models.CharField(max_length=20, null=False)
    reasonforleave = models.CharField(max_length=64, null=True, default='')


class Device(models.Model):
    class Meta:
        db_table = "device"
    dno = models.CharField(max_length=7, primary_key=True)
    dname = models.CharField(max_length=32, null=False)
    dposition = models.CharField(max_length=32, null=False)
    dstate = models.CharField(max_length=10, default='normal', null=False)
    dtype = models.CharField(max_length=10, default='会议室', null=False)


class Seat(models.Model):
    class Meta:
        db_table = 'seat'
    sno = models.CharField(max_length=7, primary_key=True)
    sposition = models.CharField(max_length=32, null=False)
    sstate = models.CharField(max_length=10, null=False)
    ip = models.GenericIPAddressField(null=False)
    stype = models.CharField(max_length=10, null=False)


class PwdAndPermission(models.Model):
    class Meta:
        db_table = 'pwdandpermission'
    u = models.ForeignKey(to='User', to_field='uno', on_delete=models.CASCADE)
    pwd = models.CharField(max_length=32, null=False)
    permission = models.CharField(max_length=1, null=False)


class OccupySeat(models.Model):
    class Meta:
        db_table = 'occupyseat'
    u = models.ForeignKey(to='User', to_field='uno', on_delete=models.CASCADE)
    s = models.ForeignKey(to='Seat', to_field='sno', on_delete=models.CASCADE)
    start_time = models.DateTimeField(null=True)
    end_time = models.DateTimeField(null=True)
    reasonforleave = models.CharField(max_length=64, null=True, default='')


class CurrentOccupy(models.Model):
    class Meta:
        db_table = 'currentoccupy'
    u = models.ForeignKey(to='User', to_field='uno', on_delete=models.CASCADE)
    s = models.ForeignKey(to='Seat', to_field='sno', on_delete=models.CASCADE)
    start_time = models.DateTimeField(null=True)

