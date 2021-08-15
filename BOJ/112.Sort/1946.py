# 신입사원

import sys
input = sys.stdin.readline
tc = int(input())
ans = [0] * tc
for idx in range(tc):
    n = int(input())
    arr = list()
    cnt = 1
    for i in range(n):
        i, j = map(int, input().split())
        arr.append([i, j])
    arr.sort()

    minValue = arr[0][1]
    for i in range(1, len(arr)):
        if minValue > arr[i][1]:
            cnt += 1
            minValue = arr[i][1]
    ans[idx] = cnt
print("\n".join(map(str, ans)))
