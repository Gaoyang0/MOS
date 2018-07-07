# -*- coding:utf-8 -*-
# Author:DaoYang
import re
from app import public_list

def get_permission(num):
    res = {
        'user': True if num & 4 else False,
        'seat': True if num & 2 else False,
        'device': True if num & 1 else False
    }
    return res


def position_analysis(megs):
    s = megs.split('#')
    res = {
        'region': re.sub('@', '',  s[0]),
        'x': int(s[1])-1,
        'y': int(s[2])-1,
        'width': int(s[3]),
        'height': int(s[4])
    }
    return res

def query_analysis(keyword, flag):
    if keyword == '':
        if flag == 'user':
            res = {
                'no': '',
                'name': '',
                'department': '',
                'duty': ''
            }
        elif flag == 'device':
            res = {
                'no': '',
                'name': '',
                'type': '',
                'state': ''
            }
        elif flag == 'seat':
            res = {
                'no': '',
                'state': '',
                'type': ''
            }
        else:
            res = None
        return res
    else:
        limit = keyword.split()
        if flag == 'user':
            res = {
                'no': '*****',
                'name': '*****',
                'department': '*****',
                'duty': '*****'
            }
            for item in limit:
                res[get_user_family(item)] = item
            return res
        elif flag == 'device':
            res = {
                'no': '*****',
                'name': '*****',
                'type': '*****',
                'state': '*****'
            }
            for item in limit:
                res[get_device_family(item)] = item
            return res
        elif flag == 'seat':
            res = {
                'no': '*****',
                'state': '*****',
                'type': '*****'
            }
            for item in limit:
                if get_seat_family(item):
                    res[get_seat_family(item)] = item
            return res


def get_seat_family(str):
    # state = ['占用', '空闲', '损坏']
    # type = ['高级座席', '普通座席', '外访座席']
    state = public_list.state_lsit
    type = public_list.seat_type
    if str.isdigit():
        return 'no'
    elif str in state:
        return 'state'
    elif str in type:
        return 'type'


def get_device_family(str):
    # type = ['会议室', '打印机']
    # state = ['占用', '空闲', '损坏']
    type = public_list.device_type_list
    state = public_list.state_lsit
    if str.isdigit():
        return 'no'
    elif str in type:
        return 'type'
    elif str in state:
        return 'state'
    else:
        return 'name'


def get_user_family(str):
    # department = ['经理部', '财务部', '人事部', '市场部', '行政部', '后勤部', '技术部', '其他']
    # duty = ['董事长', '总经理', '主管', '会计', '助理', '文员']
    department = public_list.department_list
    duty = public_list.duty_list
    if str.isdigit():
        return 'no'
    elif str in department:
        return 'department'
    elif str in duty:
        return 'duty'
    else:
        return 'name'

def get_permission_val(permission_list):
    res = 0
    for item in permission_list:
        if item == '1':
            res += 4
        elif item == '2':
            res += 2
        elif item == '3':
            res += 1
        else:
            pass
    return res


