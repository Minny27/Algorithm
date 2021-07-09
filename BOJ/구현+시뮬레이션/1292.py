# 쉽게 푸는 문제

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
arr = []
for i in range(1, 1001):
    for j in range(i):
        arr.append(i)
arr = arr[n - 1 : m]
print(sum(arr))