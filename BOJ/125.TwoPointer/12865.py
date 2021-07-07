# -*- coding: utf-8 -*-

# 평범한 배낭
# 시간 : 2시간
# 구현 아이디어 : 처음에 투포인터로 구현을 생각했지만 투포인터는 연속된 집합일 때만 이용하는 것을 깨달았고
# dp를 이용해서 dp[k]부터 시작해서 j가 보다 크거나 같으면 dp[j]와 dp[j - w] + v로 갱신하는 방식
# 각 배낭의 무게로 나올 수 있는 모든 경우의 수에서의 가치의 최대값을 구하기 위해서
# ex) 3 -> (3), (2, 1), (1, 1, 1)
# 여기서 k가 3이면 3은 dp[3]만 갱신, 2라면 dp[3], dp[2] 갱신, 1이라면 dp[3], dp[2], dp[1] 갱산 방삭
import sys
input = sys.stdin.readliner
n, k = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(n)]
dp = [0] * (100001)
for i in range(n):
    w, v = arr[i][0], arr[i][1]
    for j in range(k, 0, -1):
        if w <= j:
            dp[j] = max(dp[j], dp[j - w] + v)
print(dp[k])

# Test Case
# 4 7
# 7 30
# 7 20
# 1 10
# 2 30
# 답: 40

# 4 7
# 1 10
# 1 10
# 10 10
# 7 100
# 답: 100

# 1 1
# 1 0
# 답: 0

# 8 4
# 1 3
# 1 6
# 1 3
# 1 3
# 1 3
# 1 2
# 1 5
# 1 8
# 답: 22

# 4 5
# 1 4
# 1 8
# 3 3
# 4 8
# 답: 16

# 5 5
# 1 100
# 3 10
# 1 20
# 3 100
# 1 100
# 210

# 투포인터 실패 -> 투포인터는 연속되는 합을 구할 때 시간 복잡도 O(n)으로 구할 수 있을 때만..
# import sys
# input = sys.stdin.readline
# n, k = map(int, input().split()) # 물품 수, 총 무게
# arr = [list(map(int, input().split())) for _ in range(n)]

# def solution():
#     w = 0
#     tmpValue = 0
#     ans = 0
#     s, e = 0, 0
#     while s < n:
#         if k >= w + arr[e][0]:
#             w = w + arr[e][0]
#             tmpValue += arr[e][1]
#             e += 1
#             if e >= n:
#                 ans = max(ans, tmpValue)
#                 break
#         else:
#             ans = max(ans, tmpValue)
#             w -= arr[e - 1][0]
#             tmpValue -= arr[e - 1][1]
#             e += 1
#             if e >= n:
#                 w = 0
#                 tmpValue = 0
#                 s += 1
#                 e = s
#     print(ans)
# solution()

