# 크리스마스 선물
# 구현 아이디어 : 띄어쓰기를 배열에 받고 0 일때는 -1, 그 이외는 g에서 꺼내기
# 배운점 : 함수를 정의해서 구현하면 속도가 더 빠르고 입력변수는 함수밖에 선언하는 것이 미세하게 더 빠르다.
# heap을 구현할 때 튜플형태로 push pop하는 것보다 -로 들어가서 -로 나오는 것이 더 빠르다.

import sys
from heapq import heappush, heappop

input = sys.stdin.readline
n = int(input())

def solution():
    g = [] # gift
    s = ""
    for i in range(n):
        tmp = list(map(int, input().split()))
        if tmp[0] == 0:
            if len(g) == 0:
                s += str(-1) + "\n"
            else:
                # s += str(heappop(g)[1]) + "\n"
                s += str(-heappop(g)) + "\n"
        else:
            for i in range(1, len(tmp)):
                # heappush(g, (-tmp[i], tmp[i]))
                heappush(g, -tmp[i])
    print(s)
solution()