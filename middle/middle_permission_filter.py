# -*- coding:utf-8 -*-
# Author:DaoYang

from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import render, HttpResponse, redirect
from utils.global_utils import get_permission

class PermissionFilter(MiddlewareMixin):
    def process_request(self, request):
        white_list = ['/app/index/', '/app/logout/', '/app/query-user/', '/app/query-seat/', '/app/query-device/',
                      '/app/personal-center/', '/app/update-personal-msg/', '/app/change-personal-state/',
                      '/app/ajax-seat-msg/', '/app/detail-info/', '/app/occupy-seat/', '/app/test/']
        user_list = ['/app/manage-user/', '/app/insert-user/', '/app/update-user/', '/app/delete-user/',
                     '/app/checkno/']
        seat_list = ['/app/manage-seat/', '/app/insert-seat/', '/app/update-seat/', '/app/delete-seat/',
                     '/app/checkno/', '/app/manage-occupy-seat/']
        device_list = ['/app/manage-device/', '/app/insert-device/', '/app/update-device/', '/app/delete-device/',
                       '/app/checkno/', '/app/check-distribute-no/']
        current_url = request.path
        if current_url == '/app/login/':
            pass
        else:
            if request.session.get('is_login', default=False) is not True:
                return render(request, 'login.html')
            else:
                permission = int(request.session.get('permission', default=0))
                if permission == 0:
                    if current_url in white_list:
                        pass
                    else:
                        return render(request, 'lack_of_authority.html')  # 权限不够
                else:
                    permission_list = get_permission(permission)
                    if permission_list['user']:
                        white_list.extend(user_list)
                    if permission_list['seat']:
                        white_list.extend(seat_list)
                    if permission_list['device']:
                        white_list.extend(device_list)
                    if current_url in white_list:
                        pass
                    else:
                        return render(request, 'lack_of_authority.html')  # 权限不够


    def process_response(self, request, response):
        return response
