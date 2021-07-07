# -*- coding: utf-8 -*-

# 가장 긴 증가하는 부분 수열
# 시간 : 20분
# 구현 아이디어 : dp
# 처음에는 arr[i]과 arr[j]를 비교해서 전자가 크면 갱신하는 방식으로 생각을 했는데
# 모든 값을 갱신하지 못하는 경우가 있어 모든 경우의 수를 다 체크할 수 있도록 arr[i]를 기준으로 arr[j] 값이 큰 경우만 크기를 증가시키는데
# 이미 더 큰 값이 저장되어있으면 갱신하지 않는다.
import sys
input = sys.stdin.readline
n = int(input())
arr = list(map(int, input().split()))
dp = [1 for _ in range(n)]
for i in range(n - 1):
    for j in range(i + 1, n):
        if arr[i] < arr[j]:
            dp[j] = max(dp[j], dp[i] + 1)
print(max(dp))
