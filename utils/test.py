# -*- coding:utf-8 -*-
# Author:DaoYang

from utils.global_utils import get_permission, query_analysis, position_analysis, get_permission_val
import json, re
if __name__ == "__main__":

    # print(get_permission(5))


    # dic = {'name':'Tom', 'age':20,  'salary' : 8800.00}
    # for k,v in dic.items():
    #     print(k,v)
    # print('s')

    # res = query_analysis('15 阿萨去 经理部 董事长', 'user')
    # print(res)

    # res = query_analysis('15 阿萨去 会议室 占用', 'device')
    # print(res)

    # res = query_analysis('15 阿萨去 占用', 'seat')
    # print(res)

    # res = query_analysis('', 'user')
    # print(res)
    # print(position_analysis('@12#100#200'))
    # matrix = [[0 for i in range(20)] for i in range(16)]
    # temp = json.dumps(matrix)
    # t = json.loads(temp)
    # print(temp)
    # print(matrix)
    # print(matrix[15][19])


    for i in range(0, 16):
        # print(i)
        for j in range(0, 20):
            print(str(matrix[i][j]) + "   ", end='')
        # print(" ",end='')
        print('\n')

    # for i in range(3):
    #     print(i)
    # print(get_permission_val(''))
    # str = ''
    # s = re.findall("\d+", '78das456')
    # for item in s:
    #     str += item
    # print(str)

    # import datetime
    #
    # nowTime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')  # 现在
    # pastTime = (datetime.datetime.now() - datetime.timedelta(hours=1)).strftime('%Y-%m-%d %H:%M:%S')  # 过去一小时时间
    # afterTomorrowTime = (datetime.datetime.now() + datetime.timedelta(days=2)).strftime('%Y-%m-%d %H:%M:%S')  # 后天
    # tomorrowTime = (datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%Y-%m-%d %H:%M:%S')  # 明天
    # print('\n', nowTime, '\n', pastTime, '\n', afterTomorrowTime, '\n', tomorrowTime)

    for i in range(1,16):
        print(i)





    print('---------end----------')