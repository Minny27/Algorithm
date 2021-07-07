# 검증수
# 시간 : 3분

import sys
input = sys.stdin.readline
arr = list(map(int, input().split()))
ans = 0
for i in range(len(arr)):
    ans += arr[i] * arr[i]
print(ans % 10)