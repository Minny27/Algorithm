# -*- coding: utf-8 -*-

# ATM
# 시간 : 18분
# 구현 아이디어 : dp

import sys
input = sys.stdin.readline
n = int(input())
p = sorted(list(map(int, input().split())))
ans = [0] * (n + 1)
for i in range(1, n + 1):
    ans[i] += p[i - 1] + ans[i - 1]
print(sum(ans))