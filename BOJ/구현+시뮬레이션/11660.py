# -*- coding: utf-8 -*-

# 구간 합 구하기 5
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
arr = [list(map(int, input().split())) for _ in range(n)]
ans = [0] * m
for k in range(m):
    x1, y1, x2, y2 = map(int, input().split())
    for i in range(x1 - 1, x2):
        for j in range(y1 - 1, y2):
            ans[k] += arr[i][j]
print("\n".join(map(str, ans)))
