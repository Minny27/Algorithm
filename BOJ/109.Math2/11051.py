# 이항 계수 2
# import math
# n, k = map(int, input().split())
# dp = [0] + [1] * 1010

# # 기존 코드 - 중간 값 오버플로우로 안 되는 것이 아니라?
# # '/' -> float 오차발생할 수 있음 //  '//' -> int 오차 x
# def fact(n):
#     if n == k or k == 0:
#         print(1)
#         return
#     if n < k:
#         print(0)
#         return
    
#     for i in range(2, n + 1):
#         dp[i] = dp[i - 1] * i 
#     print(dp[n] // (dp[n-k] * dp[k]) % 10007)   
# fact(n)

# 민영이 코드 이해가 안 되서..
# 파스칼 삼각형이구나..
def solution():
    n, k = map(int, input().split())
    dp = [[0 for _ in range(1001)] for _ in range(1001)]
    for i in range(n+1):
        dp[i][0] = 1
    for j in range(k+1):
        dp[j][j] = 1

    for i in range(1, n+1):
        for j in range(1, k+1):
            dp[i][j] = (dp[i-1][j] + dp[i-1][j-1]) % 10007
    return dp[n][k]

result = solution()
print(result)