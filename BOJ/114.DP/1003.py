# -*- coding: utf-8 -*-

# 피보나치 함수
# 시간 : 30분
# 구현 아이디어 : 
# 1) 재귀로 문제를 해결하려고 했지만 시간 초과가 발생
# 2) 0의 수는 n - 2, 1의 개수는 n - 1 이라고 생각했지만 예외가 있었음(ex) 5 -> 3 5)
# 3) 5를 도식화해보니까 for문을 반대로해서 0의 개수와 1의 개수를 구할 수 있을 것같다고 생각했음
# 4) 0의 개수는 2가 나온 개수와 같고, 1의 개수는 2와 3이 나온 개수를 더한 것과 같다는 것을 발견
import sys
input = sys.stdin.readline
t =  int(input())
ans = []
for i in range(t):
    n = int(input())
    if n == 0:
        ans.append([1, 0])
    elif n == 1:
        ans.append([0, 1])
    else:
        dp = [0] * (n + 1)
        dp[n], dp[n - 1] = 1, 1
        for j in range(n - 2, -1, -1):
        # for j in reversed(range(n - 1)): # 위보다 더 시간이 오래걸림
            dp[j] = dp[j + 1] + dp[j + 2]
        ans.append([dp[2], dp[1]])
for i in range(t):
    print(" ".join(map(str, ans[i])))

# 2)
# for i in range(t):
#     n = int(input())
#     if n == 0:
#         ans.append([1, 0])
#     elif n == 1:
#         ans.append([0, 1])
#     else:
#         ans.append([n - 2, n - 1])
# for i in range(t):
#     print(" ".join(map(str, ans[i])))

# 1)
# def fibo(n):
#     if n == 0:
#         dp[0] += 1
#         return 0
#     if n == 1:
#         dp[1] += 1
#         return 1
#     return fibo(n - 2) + fibo(n - 1)
# for i in range(t):
#     n = int(input())
#     dp = [0, 0]
#     fibo(n)
#     ans.append([dp[0], dp[1]])
# for i in range(t):
#     print(" ".join(map(str, ans[i])))
