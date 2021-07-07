# -*- coding: utf-8 -*-

# 평범한 배낭
# 구현 아이디어 : 전체 무게 k, 물건의 무게 w가 주어졌을 때, k ~ w 까지 무게에서의 최대 가치를 갱신 
# 값을 갱신할 때는 for문을 거꾸로 구현 -> 무게 w를 중복 계산하지 않게 하기 위함
import sys
input = sys.stdin.readline
n, k = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(n)]
dp = [0] * (k + 1)
for i in range(n):      
    w, v = arr[i][0], arr[i][1]
    for j in range(k, w - 1, -1):
        # 한 물건의 무게 w와 조합 할 수 있는 무게가 j - w, j - w인덱스의 가치가 dp[j - w]
        dp[j] = max(dp[j], dp[j - w] + v)
print(dp[k])

# 5 5
# 3 30
# 2 20
# 2 40
# 3 20
# 1 40

# 5 5
# 4 1
# 1 1
# 1 1
# 1 1
# 1 1

# 1 5
# 2 20