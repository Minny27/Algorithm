# 방 번호

import sys
input = sys.stdin.readline
n = int(input())
numCost = list(map(int, input().split()))
dp = ['0'] * (int(input()) + 1)
for i in reversed(range(n)):
    maxNum = numCost[i] # 문방구에서 살 수 있는 가장 큰 수
    for j in range(maxNum, len(dp)):
        dp[j] = dp[j - maxNum] + str(i) if int(dp[j]) < int(dp[j - maxNum] + str(i)) else dp[j]
print(int(dp[-1]))


# Test Case

# 3
# 6 7 8
# 21

# 210


# 3
# 5 23 24
# 30

# 20


# 10
# 1 1 1 1 1 1 1 1 1 1
# 50

# 99999999999999999999999999999999999999999999999999

# 5
# 1 1 2 3 4
# 20

# 11111111111111111111


# 5
# 1 1 2 2 2
# 20

# 11111111111111111111


# 5
# 1 2 3 4 5
# 20

# 2111111111111111111
