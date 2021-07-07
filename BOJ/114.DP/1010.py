# 다리 놓기
# 시간 : 33분

import sys
from math import comb
t = int(input())

def solution():
    ans = [0] * t
    for i in range(t):
        n, m = map(int, input().split())
        ans[i] = comb(m, n)
    print("\n".join(map(str, ans)))
solution()
