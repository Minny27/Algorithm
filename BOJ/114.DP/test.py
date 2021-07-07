import sys
input = sys.stdin.readline
max = sys.maxsize
t = int(input())
ans = []

def solution():
    n = int(input())
    file = list(map(int, input().split()))
    dp = [[0] * n for _ in range(n)]
    sum = [0]
    for f in file:
        sum.append(sum[-1] + f)
    for d in range(1, n):
        for i in range(n - d):
            j = d + i
            dp[i][j] = max
            for k in range(i, j):
                dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j] + sum[j + 1] - sum[i])
    ans.append(dp[0][n - 1])
for i in range(t):
    solution()
print("\n".join(map(str, ans)))