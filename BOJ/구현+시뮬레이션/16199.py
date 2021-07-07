# 나이 계산하기

import sys
input = sys.stdin.readline
y, m, d = map(int, input().split()) # 생년월일
y1, m1, d1 = map(int, input().split()) # 현재 날짜

def solution():
    if y1 - y == 0:
        print(y1 - y)
    elif y1 - y >= 1 and (m1 < m or(m1 == m and d1 < d)):
        print(y1 - y - 1)
    else:
        print(y1 - y)
    print(y1 - y + 1)
    print(y1 - y)
solution()
