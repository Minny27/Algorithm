# -*- coding: utf-8 -*-

# 로프
import sys
input = sys.stdin.readline
n = int(input())
arr = [int(input()) for _ in range(n)]
arr.sort()
ans = 0
for i in range(n):
    ans = max(ans, arr[i] * (n - i))
print(ans)