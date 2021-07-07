# 두 수의 합

import sys
from bisect import bisect_left as bl
input = sys.stdin.readline
n = int(input())
arr = list(map(int, input().split()))
arr.sort()
x = int(input())

def solution():
    ans = set()
    visited = [1] * n
    for i in range(n):
        if visited[i]:
            visited[i] = 0
            idx = bl(arr, x - arr[i])
            if idx >= n or arr[i] == arr[idx] or arr[i] + arr[idx] != x:
                continue
            visited[idx] = 0
            ans.add((arr[i], arr[idx]))
    print(len(ans))
solution()