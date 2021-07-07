# 페르마의 크리스마스 정리
# 구현 아이디어 : 에라토스테네스의 체, 소수 % 4 == 1 개수

import sys
from bisect import bisect_left as bl, bisect_right as br
input = sys.stdin.readline

def primeNum():
    pNum = list(range(1000000))
    pNum[0], pNum[1] = 0, 0
    for i in range(int(1000000 ** 0.5 + 1)):
        if not pNum[i]:
            continue
        for j in range(i + i, 1000000, i):
            pNum[j] = 0
    pNum = list(filter(None, pNum))
    return pNum

def solution(pN):
    s = ""
    while 1:
        cnt1, cnt2 = 0, 0
        l, u = map(int, input().split())
        if l == u == -1: 
            break
        ans = pN[bl(pN, l) : br(pN, u)]
        cnt1 = len(ans)
        for i in ans:
            if i % 4 == 1:
                cnt2 += 1
        if l <= 2 and u >= 2: 
            cnt2 += 1
        # print(l, u, cnt1, cnt2)
        s += str(l) + " " + str(u) + " " + str(cnt1) + " " + str(cnt2) + "\n"
pN = primeNum()
solution(pN)