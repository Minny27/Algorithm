# -*- coding: utf-8 -*-

# 기능개발
# 시간 : 15분
import math

def solution(progresses, speeds):
    pro = progresses
    spe = speeds
    ans = []
    time = []
    for i in range(len(pro)):
        time.append(math.ceil((100 - pro[i]) / spe[i]))
    
    tmp = time[0]
    cnt = 1
    for i in range(1, len(pro)):
        if tmp >= time[i]:
            cnt += 1
            if i == len(pro) - 1:
                ans.append(cnt)
        else:
            ans.append(cnt)
            tmp = time[i]
            cnt = 1
            if i == len(pro) - 1:
                ans.append(1)
    return ans
