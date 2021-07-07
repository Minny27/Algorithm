# 스티커
# 시간 : 1시간
# 구현 아이디어 : 배열의 행을 하나 더 생성해서 아무것도 떼지 않은 경우를 세주기
# 경우의수:
# 1) 위 스티커를 뗀 경우 -> 현재위치 + max(이전 열의 아래까지의 최대값, 이전 이전까지의 최대값)
# 2) 아래 스티커를 뗀 경우 -> 현재위치 + max(이전 열의 위까지의 최대값, 이전 이전까지의 최대값)
# 3) 아무것도 떼지 않은 경우 -> max(이전 열의 위까지의 최대값, 이전 열의 아래까지의 최대값)

import sys
input = sys.stdin.readline
t = int(input())

def solution():
    ans = []
    for _ in range(t):
        n = int(input())
        sticker = [list(map(int, input().split())) for _ in range(2)]
        dp = [[0 for _ in range(n)] for _ in range(3)]
        dp[1][0], dp[2][0] = sticker[0][0], sticker[1][0]
        for j in range(1, n):
            dp[0][j] = max(dp[1][j - 1], dp[2][j - 1])
            dp[1][j] = sticker[0][j] + max(dp[0][j - 1], dp[2][j - 1])
            dp[2][j] = sticker[1][j] + max(dp[0][j - 1], dp[1][j - 1])
        ans.append(max(dp[1][n - 1], dp[2][n - 1]))
    print("\n".join(map(str, ans)))
solution()