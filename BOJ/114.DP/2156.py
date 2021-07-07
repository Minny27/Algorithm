# -*- coding: utf-8 -*-

# 포도주 시식
# 시간 : 1시간 15분
# 계단오르기(2579)와 똑같은 문제라고 생각하고 접근했다가 큰 코 다쳤다..
# 구현 아이디어 : dp
# 먼저 계단 오르기와 다른 점 -> 시작점과 끝 점을 무조건 모두 포함한다는 점, 점프의 횟수가 임의적이라는 점
# 1) 경우의 수 체크하기 -> i번 째를 기준으로 i - 1번째를 마신 경우, i - 2번 째를 마신 경우, i번 째를 먹지 않은 경우
# 2) 즉, 1011, 101, 0 -> 한 위치에서 세가지 경우가 나올 수 있다.
import sys
input = sys.stdin.readline
n = int(input())
arr = [0] # 인덱스 3부터 체크하기 위해서 0 하나를 초기화
dp = [0] * (n + 1)
for i in range(n):
    arr.append(int(input()))
if n <= 2:
    print(sum(arr))
    quit(0)
dp[1], dp[2] = arr[1], arr[1] + arr[2]
for i in range(3, n + 1):
    # dp[i]를 갱신할 때, i - 1을 마시고 온 경우, i - 2를 마시고 온 경우, i를 마시지 않는 경우 세가지를 체크
    dp[i] = max(dp[i - 3] + arr[i - 1] + arr[i], dp[i - 2] + arr[i], dp[i - 1])
print(dp[n])

# Test Case
# 6
# 100
# 100
# 1
# 1
# 100
# 100
# 6
# 999
# 999
# 1
# 1
# 999
# 999