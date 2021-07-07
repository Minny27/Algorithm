# -*- coding: utf-8 -*-

# RGB 거리
# 시간 : 1시간 50분
# 구현 아이디어 : i번 째 집에 빨, 초, 파를 칠했을 때, i - 1번 째 집에서 최소를 더한 값을 갱신
import sys
input = sys.stdin.readline
n = int(input())
rgb = [list(map(int, input().split())) for _ in range(n)]
for i in range(1, n):
    rgb[i][0] = min(rgb[i - 1][1], rgb[i - 1][2]) + rgb[i][0]
    rgb[i][1] = min(rgb[i - 1][0], rgb[i - 1][2]) + rgb[i][1]
    rgb[i][2] = min(rgb[i - 1][0], rgb[i - 1][1]) + rgb[i][2]
print(min(rgb[n - 1]))



# d = [[1, 2], [0, 2], [0, 1]] # 행의 첫번쨰 인덱스의 값을 기준으로 비교할 인덱스
# rgb = [list(map(int, input().split())) for _ in range(n)]
# dp = [[sys.maxsize for _ in range(3)] for _ in range(n)]
# dp[0][0], dp[0][1], dp[0][2] = rgb[0][0], rgb[0][1], rgb[0][2]
# for i in range(1, n):
#     for j in range(3):
#         a, b = d[j]
#         minValue = 0
#         k = 0
#         if rgb[i][a] < rgb[i][b]:
#             k, minValue = a, rgb[i][a]
#         else:
#             k, minValue = b, rgb[i][b]
#         dp[i][k] = min(dp[i][k], dp[i - 1][j] + minValue)
# print(dp)
# print(min(dp[n - 1]))

# 3
# 1 2 3
# 3 2 1
# 4 5 2