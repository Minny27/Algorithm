# 용액
# 구현 아이디어 : 먼저 산성 또는 알칼리로만 이루어져서 합의 최소가 maxsize를 넘지 않는다고 가정
# bisect를 이용해서 arr 에서 원소를 하나씩 확인하면서 s(-99)이면 -s(99)의 인덱스를 구하고
# 만약 99가 있으면 그 값을 쓰고 없으면 99가 있을 것으로 예측되는 인덱스 - 1 과 99가 있을 것으로 예측되는 인덱스를 기준으로
# s + e 의 절대값과 현재 0과 가장 가까운 정도를 비교 후 작으면 저장

import sys
from bisect import bisect_left as bl
input = sys.stdin.readline
n = int(input())
arr = list(map(int, input().split()))

def solution():
    # maxValue = -sys.maxsize -1
    minDistnace = sys.maxsize # 0과 가장 가까운 거리
    ans = [0] * 2
    for i in range(n): 
        s = arr[i]
        e = 0
        if bl(arr, -s) >= n:
            e = arr[bl(arr, -s) - 1]
        elif arr[bl(arr, -s)] == -s:
            e = arr[bl(arr, -s)]
        else:
            e = abs(s + arr[bl(arr, -s) - 1]) < abs(s + arr[bl(arr, -s)]) and arr[bl(arr, -s) - 1] or arr[bl(arr, -s)]
        if s == e:
            continue
        if minDistnace > abs(s + e):
            minDistnace = abs(s + e)
            if s > e: 
                s, e = e, s
            ans[0], ans[1] = s, e
    print(" ".join(list(map(str, ans))))
solution()