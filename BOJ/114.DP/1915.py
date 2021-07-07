# -*- coding: utf-8 -*-

# 가장 큰 정사각형
# 시간 : 2시간
# 구현 아이디어 : 그래프(g)에서 정사각형의 크기가 커지는 것을 생각했을 때
# 정사각형의 맨 오른쪽 맨 밑 인덱스에 가장 크게 구현할 수 있는 변의 길이를 저장 -> dp[i][j]를 기준으로 왼쪽, 왼쪽 위, 위 중 가장 작은 값의 + 1로 구현
# 그 과정에서 가장 큰 값을 ans에 저장
# dp를 (n + 1) * (m + 1) 로 만드는 이유 -> i 또는 j가 0일 경우를 방지
import sys
input = sys.stdin.readline
n, m  = map(int, input().split())
g = [list(map(int, list(map(int, input().strip())))) for _ in range(n)]
dp = [[0 for _ in range(m + 1)] for _ in range(n + 1)]
ans = 0
for i in range(1, n + 1):
    for j in range(1, m + 1):
        if g[i - 1][j - 1] == 1:
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
        ans = max(ans, dp[i][j])
print(ans ** 2)
