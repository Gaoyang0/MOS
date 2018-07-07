import datetime
import re

from django.db.models import Q
from django.shortcuts import render, HttpResponse, redirect
from django.utils.safestring import mark_safe
from django.db import transaction

from app import models, public_list
from utils.paging import Page
import json, os
from utils import global_utils


# Create your views here.


def index(request):
    return render(request, 'personal-maxtrix.html', {'hupic': get_upic(request), 'width': [1] * 20, 'height': [1] * 16, 'flag_table': 'index'})


def login(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    elif request.method == 'POST':
        u = request.POST.get('username', None)
        p = request.POST.get('password', None)
        if u and p:
            res = models.User.objects.filter(uno=u).first()
            if res:
                pp = models.PwdAndPermission.objects.filter(u_id=u, pwd=p).first()
                if pp:
                    request.session['uno'] = u
                    request.session['permission'] = pp.permission
                    request.session['is_login'] = True
                    request.session.set_expiry(60 * 10)         # 保存10分钟
                    return redirect('/app/index')
                else:
                    return render(request, 'login.html', {'error': '用户名或密码错误'})
            else:
                return render(request, 'login.html', {'error': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'error': '用户名或密码不能为空'})


def logout(request):
    request.session.clear()
    return redirect('/app/login/')


# 管理坐席
def manage_seat(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword', '')
        limit = global_utils.query_analysis(keyword, 'seat')
        current_page = int(request.GET.get('p', default=1))
        data_count = models.Seat.objects.filter(
            Q(sno__contains=limit['no']) | Q(sstate__contains=limit['state']) | Q(stype__contains=limit['type'])).count()
        page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
        table_body = models.Seat.objects.filter(Q(sno__contains=limit['no']) | Q(sstate__contains=limit['state']) | Q(stype__contains=limit['type']))[
                     page_obj.start:page_obj.end]
        page_str = page_obj.page_str('/app/manage-seat', keyword)
        table_head = ['座位编号', '位置', 'IP', '状态', '类型']
        return render(request, 'manage-matrix.html',{'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str,
                       'flag_table': 'seat'})


def insert_seat(request):
    if request.method == 'GET':
        return render(request, 'insert-matrix.html', {'hupic': get_upic(request), 'state_list': public_list.state_lsit, 'seat_type': public_list.seat_type, 'flag_table': 'seat'})
    elif request.method == 'POST':
        sno = request.POST.get('sno', default='')
        sposition = request.POST.get('sposition', default='')
        ip = request.POST.get('ip', default='')
        sstate = request.POST.get('sstate', default='')
        stype = request.POST.get('stype', default='')
        models.Seat.objects.create(sno=sno, sposition=sposition, ip=ip, sstate=sstate, stype=stype)
        # print(sno, sposition, sstate)
        return redirect('/app/manage-seat/')


def update_seat(request):
    if request.method == 'GET':
        sno = request.GET.get('sno', default='')
        seat = models.Seat.objects.filter(sno=sno).first()
        return render(request, 'update-matrix.html',
                      {'hupic': get_upic(request), 'state_list': public_list.state_lsit, 'seat': seat, 'flag_table': 'seat', 'seat_type': public_list.seat_type})
    elif request.method == 'POST':
        sno = request.POST.get('sno', default='')
        sposition = request.POST.get('sposition', default='')
        ip = request.POST.get('ip', default='')
        sstate = request.POST.get('sstate', default='')
        stype = request.POST.get('stype', default='')
        # print(sno, sposition, sstate)
        models.Seat.objects.filter(sno=sno).update(sposition=sposition, sstate=sstate, ip=ip, stype=stype)
        return redirect('/app/manage-seat/')


def delete_seat(request):
    if request.method == 'GET':
        sno = request.GET.get('sno', '')
        models.Seat.objects.filter(sno=sno).delete()
    return redirect('/app/manage-seat/')


# 管理设备
def manage_device(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword', '')
        limit = global_utils.query_analysis(keyword, 'device')
        current_page = int(request.GET.get('p', default=1))
        data_count = models.Device.objects.filter(
            Q(dno__contains=limit['no']) | Q(dname__contains=limit['name']) | Q(
                dstate__contains=limit['state']) | Q(dtype__contains=limit['type'])).count()
        page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
        table_body = models.Device.objects.filter(
            Q(dno__contains=limit['no']) | Q(dname__contains=limit['name']) | Q(
                dstate__contains=limit['state']) | Q(dtype__contains=limit['type']))[page_obj.start:page_obj.end]
        page_str = page_obj.page_str('/app/manage-device', keyword)
        table_head = ['设备编号', '设备名', '位置', '状态', '类型', '操作']
        return render(request, 'manage-matrix.html',
                      {'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str,
                       'flag_table': 'device'})


def insert_device(request):
    if request.method == 'GET':
        return render(request, 'insert-matrix.html', {'hupic': get_upic(request), 'device_type_list': public_list.device_type_list,
                                                      'state_list': public_list.state_lsit, 'flag_table': 'device'})
    elif request.method == 'POST':
        dno = request.POST.get('dno', default='')
        dname = request.POST.get('dname', default='')
        dposition = request.POST.get('dposition', default='')
        dtype = request.POST.get('dtype', default='')
        dstate = request.POST.get('dstate', default='')
        models.Device.objects.create(dno=dno, dname=dname, dposition=dposition, dtype=dtype, dstate=dstate)
        # print(dno, dname, dposition, dtype, dstate)
        return redirect('/app/manage-device/')


def update_device(request):
    if request.method == 'GET':
        dno = request.GET.get('dno', default='')
        device = models.Device.objects.filter(dno=dno).first()
        return render(request, 'update-matrix.html', {'hupic': get_upic(request), 'device_type_list': public_list.device_type_list,
                                                      'state_list': public_list.state_lsit, 'device': device,
                                                      'flag_table': 'device'})
    elif request.method == 'POST':
        dno = request.POST.get('dno', default='')
        dname = request.POST.get('dname', default='')
        dposition = request.POST.get('dposition', default='')
        dtype = request.POST.get('dtype', default='')
        dstate = request.POST.get('dstate', default='')
        models.Device.objects.filter(dno=dno).update(dname=dname, dposition=dposition, dtype=dtype, dstate=dstate)
        return redirect('/app/manage-device/')


def delete_device(request):
    if request.method == 'GET':
        dno = request.GET.get('dno', '')
        models.Device.objects.filter(dno=dno).delete()
    return redirect('/app/manage-device/')


# 管理用户
def manage_user(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword', '')
        limit = global_utils.query_analysis(keyword, 'user')
        current_page = int(request.GET.get('p', default=1))
        data_count = models.User.objects.filter(Q(uno__contains=limit['no']) | Q(uname__contains=limit['name']) | Q(
            duty__contains=limit['duty']) | Q(department__contains=limit['department'])).count()
        page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
        table_body = models.User.objects.filter(Q(uno__contains=limit['no']) | Q(uname__contains=limit['name']) | Q(
            duty__contains=limit['duty']) | Q(department__contains=limit['department']))[
                     page_obj.start:page_obj.end].values('uno', 'uname', 'duty', 'department',
                                                         'housephone')
        page_str = page_obj.page_str('/app/manage-user', keyword)
        table_head = ['职员编号', '姓名', '职务', '部门', '内线电话', '操作']
        return render(request, 'manage-matrix.html',
                      {'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str, 'flag_table': 'user',
                       'keyword': keyword})


def insert_user(request):
    if request.method == 'GET':
        return render(request, 'insert-matrix.html',
                      {'hupic': get_upic(request), 'department_list': public_list.department_list, 'duty_list': public_list.duty_list,
                       "flag_table": 'user'})
    elif request.method == 'POST':
        uno = request.POST.get('uno', default='')
        uname = request.POST.get('uname', default='')
        sex = request.POST.get('sex', default='')
        idnum = request.POST.get('idnum', default='')
        duty = request.POST.get('duty', default='')
        department = request.POST.get('department', default='')
        post = request.POST.get('post', default='')
        companymail = request.POST.get('companymail', default='')
        personalmail = request.POST.get('personalmail', default='')
        housephone = request.POST.get('housephone', default='')
        tel = request.POST.get('tel', default='')
        phone = request.POST.get('phone', default='')
        pwd = request.POST.get('pwd', default='')
        permission_list = request.POST.getlist('permission', default='')
        permission = global_utils.get_permission_val(permission_list)
        file_obj = request.FILES.get('upic')
        file_path = os.path.join('static/data/upic', uno + '.png')
        f = open(file_path, mode='wb')
        for item in file_obj.chunks():
            f.write(item)
        f.close()
        upic = '/static/data/upic/' + uno + '.png'
        models.User.objects.create(uno=uno, uname=uname, sex=sex, idnum=idnum, duty=duty, department=department,
                                   post=post, companymail=companymail, personalmail=personalmail,
                                   housephone=housephone, tel=tel, phone=phone, upic=upic)
        models.PwdAndPermission.objects.create(u_id=uno, pwd=pwd, permission=permission)
        # print(uno, uname, sex, idnum, duty, department, post, companymail, personalmail, ip, housephone, tel, phone, upic, pwd, permission)
        return redirect('/app/manage-user/')


def update_user(request):
    if request.method == 'GET':
        uno = request.GET.get('uno', default='')
        user = models.User.objects.filter(uno=uno).first()
        pp = models.PwdAndPermission.objects.filter(u_id=uno).first()
        return render(request, 'update-matrix.html',
                      {'hupic': get_upic(request), 'department_list': public_list.department_list, 'duty_list': public_list.duty_list, 'user': user,
                       'pp': pp, 'flag_table': 'user'})
    elif request.method == 'POST':
        uno = request.POST.get('uno', default='')
        uname = request.POST.get('uname', default='')
        sex = request.POST.get('sex', default='')
        idnum = request.POST.get('idnum', default='')
        duty = request.POST.get('duty', default='')
        department = request.POST.get('department', default='')
        post = request.POST.get('post', default='')
        companymail = request.POST.get('companymail', default='')
        personalmail = request.POST.get('personalmail', default='')
        housephone = request.POST.get('housephone', default='')
        tel = request.POST.get('tel', default='')
        phone = request.POST.get('phone', default='')
        pwd = request.POST.get('pwd', default='')
        permission_list = request.POST.getlist('permission', default='')
        print(permission_list)
        permission = global_utils.get_permission_val(permission_list)
        file_obj = request.FILES.get('upic', default='')
        if file_obj == '':
            upic = models.User.objects.filter(uno=uno).values('upic')[0]['upic']
        else:
            file_path = os.path.join('static/data/upic', uno + '.png')
            f = open(file_path, mode='wb')
            for item in file_obj.chunks():
                f.write(item)
            f.close()
            upic = '/static/data/upic/' + uno + '.png'
        models.User.objects.filter(uno=uno).update(uname=uname, sex=sex, idnum=idnum, duty=duty, department=department,
                                                   post=post, companymail=companymail, personalmail=personalmail,
                                                   housephone=housephone, tel=tel, phone=phone, upic=upic)
        models.PwdAndPermission.objects.filter(u_id=uno).update(pwd=pwd, permission=permission)
        # print(uno, uname, sex, idnum, duty, department, post, companymail, personalmail, ip, housephone, tel, phone, upic, pwd, permission)
        return redirect('/app/manage-user/')


def delete_user(request):
    if request.method == 'GET':
        uno = request.GET.get('uno', default='')
        models.User.objects.filter(uno=uno).delete()
        try:
            os.remove('static/data/upic/' + uno + '.png')
        except Exception as e:
            print('对应的图片有可能不存在')
    return redirect('/app/manage-user/')


# 用户查询
def query_user(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword', '')
        limit = global_utils.query_analysis(keyword, 'user')
        current_page = int(request.GET.get('p', default=1))
        data_count = models.User.objects.filter(Q(uno__contains=limit['no']) | Q(uname__contains=limit['name']) | Q(
            duty__contains=limit['duty']) | Q(department__contains=limit['department'])).count()
        page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
        table_body = models.User.objects.filter(Q(uno__contains=limit['no']) | Q(uname__contains=limit['name']) | Q(
            duty__contains=limit['duty']) | Q(department__contains=limit['department']))[
                     page_obj.start:page_obj.end].values('uno', 'uname', 'duty', 'department',
                                                         'housephone')
        page_str = page_obj.page_str('/app/query-user', keyword)
        table_head = ['职员编号', '姓名', '职务', '部门', '内线电话', '操作']
        return render(request, 'user-matrix.html',
                      {'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str, 'flag_table': 'user',
                       'keyword': keyword})

def query_device(request):
    keyword = request.GET.get('keyword', '')
    limit = global_utils.query_analysis(keyword, 'device')
    current_page = int(request.GET.get('p', default=1))
    data_count = models.Device.objects.filter(
        Q(dno__contains=limit['no']) | Q(dname__contains=limit['name']) | Q(
            dstate__contains=limit['state']) | Q(dtype__contains=limit['type'])).count()
    page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
    table_body = models.Device.objects.filter(
        Q(dno__contains=limit['no']) | Q(dname__contains=limit['name']) | Q(
            dstate__contains=limit['state']) | Q(dtype__contains=limit['type']))[page_obj.start:page_obj.end]
    page_str = page_obj.page_str('/app/query-device', keyword)
    table_head = ['设备编号', '设备名', '位置', '状态', '类型']
    return render(request, 'user-matrix.html',
                  {'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str,
                   'flag_table': 'device'})

def query_seat(request):
    keyword = request.GET.get('keyword', '')
    limit = global_utils.query_analysis(keyword, 'seat')
    current_page = int(request.GET.get('p', default=1))
    data_count = models.Seat.objects.filter(
        Q(sno__contains=limit['no']) | Q(sstate__contains=limit['state']) | Q(stype__contains=limit['type'])).count()
    page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
    table_body = models.Seat.objects.filter(Q(sno__contains=limit['no']) | Q(sstate__contains=limit['state'])| Q(stype__contains=limit['type']))[
                 page_obj.start:page_obj.end]
    page_str = page_obj.page_str('/app/query-seat', keyword)
    table_head = ['座位编号', '位置', '状态', '类型', '操作']
    return render(request, 'user-matrix.html',
                  {'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str,
                   'flag_table': 'seat'})

# 显示坐席状态
def seat_msg(reqquest):
    # 初始化
    msg = {}
    for i in range(1,17):
        for j in range(1, 21):
            id = str(j)+'x'+str(i);
            msg[id] = {'sno': '#', 'stype': '#', 'uname': ''}

    matrix = [[0 for i in range(20)] for i in range(16)]
    seat_all = models.Seat.objects.all().values('sposition', 'sstate', 'stype', 'sno')
    for seat in seat_all:
        temp_position = global_utils.position_analysis(seat['sposition'])
        temp_id = str(temp_position['x'] + 1) + 'x' + str(temp_position['y'] + 1)
        msg[temp_id]['stype'] = seat['stype']
        if seat['stype'] == '高级座席':
            a = 1
        elif seat['stype'] == '普通座席':
            a = 2
        elif seat['stype'] == '外访座席':
            a = 3
        if seat['sstate'] == '空闲':
            b = 1
        elif seat['sstate'] == '占用':
            uno = models.CurrentOccupy.objects.filter(s_id=seat['sno']).values('u_id')[0]['u_id']
            uname = models.User.objects.filter(uno=uno).values('uname')[0]['uname']
            msg[temp_id]['uname'] = uname
            b = 2
        elif seat['sstate'] == '损坏':
            b = 3
        for i in range(temp_position['width']):
            for j in range(temp_position['height']):
                matrix[temp_position['y'] + j][temp_position['x']] = b*10+a
                msg[temp_id]['sno'] = seat['sno']


    # 设备
    device_all = models.Device.objects.all().values('dposition')
    for device in device_all:
        temp_position = global_utils.position_analysis(device['dposition'])
        for i in range(temp_position['width']):
            for j in range(temp_position['height']):
                matrix[temp_position['y'] + j][temp_position['x'] + i] = 4

    res = {
        'matrix': matrix,
        'msg': msg
    }

    return HttpResponse(json.dumps(res))

def occupy_seat_query(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword', '')
        no = ''
        str = re.findall("\d+", keyword)
        for item in str:
            no += item
        current_page = int(request.GET.get('p', default=1))
        data_count = models.OccupySeat.objects.filter(Q(s__sno__contains=no) | Q(u__uno__contains=no)).count()
        page_obj = Page(current_page=current_page, data_count=data_count, per_page_count=10)
        table_body = models.OccupySeat.objects.filter(Q(s__sno__contains=no) | Q(u__uno__contains=no)).values('u_id', 's_id', 'start_time', 'end_time', 'reasonforleave')[page_obj.start:page_obj.end]
        page_str = page_obj.page_str('/app/manage-occupy-seat', keyword)
        table_head = ['坐席编号', '使用者编号', '开始时间', '离开时间', '离席原因']
        return render(request, 'manage-matrix.html',
                      {'hupic': get_upic(request), 'table_head': table_head, 'table_body': table_body, 'page_str': page_str,
                       'flag_table': 'occupy-seat'})

def checkno(request):
    flag = request.GET.get('flag', default='')
    if flag == 'user':
        if models.User.objects.filter(uno=request.GET.get('uno', default='')).count() == 0:
            res = {'getdata': 'true'}
            return HttpResponse(json.dumps(res))
        else:
            res = {'getdata': 'false'}
            return HttpResponse(json.dumps(res))
    elif flag == 'device':
        if models.Device.objects.filter(dno=request.GET.get('dno', default='')).count() == 0:
            res = {'getdata': 'true'}
            return HttpResponse(json.dumps(res))
        else:
            res = {'getdata': 'false'}
            return HttpResponse(json.dumps(res))
    elif flag == 'seat':
        if models.Seat.objects.filter(sno=request.GET.get('sno', default='')).count() == 0:
            res = {'getdata': 'true'}
            return HttpResponse(json.dumps(res))
        else:
            res = {'getdata': 'false'}
            return HttpResponse(json.dumps(res))

def personal_center(request):
    uno = request.session.get('uno', default='')
    user = models.User.objects.filter(uno=uno).values('uno', 'uname', 'sex', 'duty', 'department', 'post', 'idnum', 'companymail', 'personalmail',
                                       'ustate', 'housephone', 'tel', 'phone', 'upic', 'reasonforleave')
    return render(request, 'personal-maxtrix.html', {'hupic': get_upic(request), 'user': user[0], 'flag_table': 'personal_center'})

def modify_personal_msg(request):
    if request.method == 'GET':
        uno = request.session.get('uno', default='')
        user = models.User.objects.filter(uno=uno).values('uno', 'uname', 'sex', 'idnum', 'companymail', 'personalmail',
                                        'housephone', 'tel', 'phone')
        pp = models.PwdAndPermission.objects.filter(u_id=uno).values('pwd')
        return render(request, 'personal-maxtrix.html', {'hupic': get_upic(request), 'user': user[0], 'pp': pp[0], 'flag_table': 'update_personal_msg'})
    elif request.method == 'POST':
        uno = request.session.get('uno', default='')
        uname = request.POST.get('uname', default='')
        sex = request.POST.get('sex', default='')
        idnum = request.POST.get('idnum', default='')
        companymail = request.POST.get('companymail', default='')
        personalmail = request.POST.get('personalmail', default='')
        housephone = request.POST.get('housephone', default='')
        tel = request.POST.get('tel', default='')
        phone = request.POST.get('phone', default='')
        pwd = request.POST.get('pwd', default='')
        file_obj = request.FILES.get('upic', default='')
        if file_obj == '':
            upic = models.User.objects.filter(uno=uno).values('upic')[0]['upic']
        else:
            file_path = os.path.join('static/data/upic', uno + '.png')
            f = open(file_path, mode='wb')
            for item in file_obj.chunks():
                f.write(item)
            f.close()
            upic = '/static/data/upic/' + uno + '.png'
        models.User.objects.filter(uno=uno).update(uname=uname, sex=sex, idnum=idnum, companymail=companymail, personalmail=personalmail,
                                                   housephone=housephone, tel=tel, phone=phone, upic=upic)
        models.PwdAndPermission.objects.filter(u_id=uno).update(pwd=pwd)
        return redirect('/app/personal-center/')

def change_personal_state(request):
    if request.method == 'GET':
        current_user = request.session.get('uno', default='')
        user = models.User.objects.filter(uno=current_user).values('ustate')
        return render(request, 'personal-maxtrix.html', {'hupic': get_upic(request), 'flag_table': 'change_personal_state', 'user': user[0], 'ustate_list': public_list.ustate_list})
    elif request.method == 'POST':
        current_user = request.session.get('uno', default='')
        ustate = request.POST.get('ustate', default='')
        reasonforleave = request.POST.get('reasonforleave', default='')
        if ustate != '在席':
            # 修改座位状态, 修改使用记录 修改在席状态 删除当前
            try:
                with transaction.atomic():
                    models.User.objects.filter(uno=current_user).update(ustate=ustate, reasonforleave=reasonforleave)
                    current_seat = models.CurrentOccupy.objects.filter(u_id=current_user).values('s_id', 'start_time')[0]
                    sno = current_seat['s_id']
                    start_time = current_seat['start_time']
                    models.Seat.objects.filter(sno=sno).update(sstate='空闲')
                    nowTime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                    models.OccupySeat.objects.filter(s_id=sno, u_id=current_user, start_time=start_time).update(end_time=nowTime, reasonforleave=reasonforleave)
                    models.CurrentOccupy.objects.filter(u_id=current_user).delete()
                    return redirect('/app/personal-center/')
            except Exception:
                return render(request, 'personal-maxtrix.html',
                              {'hupic': get_upic(request), 'flag_table': 'change_personal_state', 'flag': 'False',
                               'ustate_list': public_list.ustate_list})

def detail_info(request):
    flag = request.GET.get('flag', default='')
    uno = request.GET.get('uno', default='')
    user = models.User.objects.filter(uno=uno).values('uno', 'uname', 'sex', 'duty', 'department', 'post', 'idnum',
                                                      'companymail', 'personalmail',
                                                       'housephone', 'tel', 'phone', 'upic', 'ustate', 'reasonforleave')
    if flag == 'user':
        return render(request, 'personal-maxtrix.html', {'hupic': get_upic(request), 'user': user[0], 'flag_table': 'personal_center'})
    elif flag == 'manage':
        return render(request, 'manage-matrix.html', {'hupic': get_upic(request), 'user': user[0], 'flag_table': 'personal_center'})

# 获取头像路径
def get_upic(request):
    uno = request.session.get('uno', default='')
    hupic = models.User.objects.filter(uno=uno).values('upic')[0]['upic']
    return hupic


# flag = 1      占位成功
# flag = 2      失败(权限不够(按部门分))
# flag = 3      失败(位子已被占)
# flag = 4      失败(位子损坏)
# flag = 5      失败(不能重复占)


def occupy_seat(request):
    sno = request.POST.get('sno', '')
    seat = models.Seat.objects.filter(sno=sno).values('sstate', 'stype')[0]
    uno = request.session.get('uno', '')
    department = models.User.objects.filter(uno=uno).first().department
    print(uno, department, seat['sstate'], seat['stype'])
    if models.CurrentOccupy.objects.filter(u_id=uno):
        res = False
        flag = 5
    else:
        if seat['sstate'] == '损坏':
            res = False
            flag = 4
        else:
            if seat['sstate'] == '空闲':
                for k,v in public_list.seat_permission_dic.items():
                    if seat['stype'] == k:
                        if department in v:
                            res = True
                            flag = 1
                        else:
                            res = False
                            flag = 2
            else:
                res = False
                flag = 3
    if res:
        try:
            with transaction.atomic():
                # 修改座位状态, 插入使用记录 修改在席状态 插入当前占位表
                models.Seat.objects.filter(sno=sno).update(sstate='占用')
                models.User.objects.filter(uno=uno).update(ustate='在席', reasonforleave='')
                nowTime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                models.OccupySeat.objects.create(s_id=sno, u_id=uno, start_time=nowTime)
                models.CurrentOccupy.objects.create(s_id=sno, u_id=uno, start_time=nowTime)
        except Exception:
            res = False
            flag = 6
    res_info = {
        'res': res,
        'flag': flag
    }
    return HttpResponse(json.dumps(res_info))

def test(request):
    return render(request, 'test.html')