# -*- coding: utf-8 -*-

# 계단 오르기
# 시간 : 1시간
# 구현 아이디어 : dp
# 3번째 계단부터 생각을 했을 때, 직전 계단을 방문을 했거나 2단계 전의 계단을 방문했을 경우 중 max를 넣으면 되는데
# 그 식이 dp[i] = max(dp[i - 3] + arr[i - 1] + arr[i], dp[i - 2] + arr[i]) 이 된다.
# dp문제의 식은 눈대중으로 답이 나올 때 내가 어떻게 답이 나왔는지를 추적해보는 과정에서 나오는 것 같다.
import sys
input = sys.stdin.readline
n = int(input())
arr = []
for i in range(n):
    arr.append(int(input()))
def solution():
    if n <= 3:
        print(sum(arr))
        return
    dp = [arr[0]] * n
    dp[0], dp[1], dp[2] = arr[0], arr[0] + arr[1], max(arr[0] + arr[2], arr[1] + arr[2])
    for i in range(3, n):
        dp[i] = max(dp[i - 3] + arr[i - 1] + arr[i], dp[i - 2] + arr[i])
    print(dp[-1])
solution()