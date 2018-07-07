# -*- coding:utf-8 -*-
# Author:

"""MOS URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from app import views

urlpatterns = [
    re_path('index/$', views.index),
    re_path('login/$', views.login),
    re_path('logout/$', views.logout),
    re_path('detail-info/$', views.detail_info),

    # 管理坐席
    re_path('manage-seat/$', views.manage_seat),
    re_path('insert-seat/$', views.insert_seat),
    re_path('update-seat/$', views.update_seat),
    re_path('delete-seat/$', views.delete_seat),

    # 管理设备
    re_path('manage-device/$', views.manage_device),
    re_path('insert-device/$', views.insert_device),
    re_path('update-device/$', views.update_device),
    re_path('delete-device/$', views.delete_device),

    # 管理人事
    re_path('manage-user/$', views.manage_user),
    re_path('insert-user/$', views.insert_user),
    re_path('update-user/$', views.update_user),
    re_path('delete-user/$', views.delete_user),

    # 用户查询
    re_path('query-user/$', views.query_user),
    re_path('query-seat/$', views.query_seat),
    re_path('query-device/$', views.query_device),
    re_path('personal-center/$', views.personal_center),
    re_path('update-personal-msg/$', views.modify_personal_msg),
    re_path('change-personal-state/$', views.change_personal_state),

    # 异步
    re_path('ajax-seat-msg/$', views.seat_msg),
    re_path('checkno/$', views.checkno),

    # 坐席使用查询
    re_path('manage-occupy-seat/$', views.occupy_seat_query),

    # 测试
    re_path('test/$', views.test),

    # 占位
    re_path('occupy-seat/$', views.occupy_seat),
]