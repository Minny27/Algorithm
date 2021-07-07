# -*- coding: utf-8 -*-
# 1로 만들기
# 시간 : 1시간
# 구현 아이디어 : dfs + dp
# 횟수를 저장하는 것이기 때문에 -1 하는 부분은 나머지 값으로 구할 수 있다.
# 1) dp 를 해시로 만들기 -> {결과값 : 횟수} 형태로 저장하기 위해서 => top다운 방식에서 올라올 때 결과값에 따른 횟수를 갱신하기 위해서
# 2) 2로 나누는 횟수와 3으로 나누는 횟수를 비교해서 더작은 값을 {결과값 : 횟수}에 갱신
# 3) top으로 다시 올라올 때 처음 값을 return 값이기 때문에 +1 + min을 해주는 것

import sys
input = sys.stdin.readline
n = int(input())
dp = {1: 0, 2: 1}

def dfs(n):
    if n in dp:
        return dp[n]
    m = 1 + min(dfs(n // 2) + n % 2, dfs(n // 3) + n % 3)
    dp[n] = m
    return m
print(dfs(n))

# 시간 초과
# ans = sys.maxsize
# def dfs(n, cnt):
#     global ans
#     if n == 1:
#         ans = min(ans, cnt)
#         return
#     if n % 3 == 0:
#         dfs(n // 3, cnt + 1)
#     if n > 1:
#         dfs(n - 1, cnt + 1)
#     if n % 2 == 0:
#         dfs(n // 2, cnt + 1)
# dfs(n, 0)
# print(ans)