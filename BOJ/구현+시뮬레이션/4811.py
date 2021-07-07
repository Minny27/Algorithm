# -*- coding: utf-8 -*-

# 알약
# 시간 : 1시간
# 구현 아이디어 : 점화식
# ex) n = 3 -> 작 + 큰 + 큰,    큰 + 작 + 큰,     큰 + 큰 + 작
#     dp[3] = dp[0] * dp[2] + dp[1] * dp[1] + dp[2] * dp[0]

import sys
input = sys.stdin.readlines()
n = [int(input[i]) for i in range(len(input) - 1)]
ans = []
dp = [1] * 31
dp[0], dp[1], dp[2] = 1, 1, 2
for i in range(3, 31):
    cnt = 0
    for j in range(i):
        cnt += dp[j] * dp[i - 1 - j]
    dp[i] = cnt
for i in n:
    ans.append(dp[i])
print("\n".join(map(str, ans)))