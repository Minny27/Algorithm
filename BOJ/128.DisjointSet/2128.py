# 마지막 조별 시합
# 시간: 20분

import sys
from itertools import combinations

input = sys.stdin.readline
n, d, k = map(int, input().split())
stu = [set(list(map(int, input().split()))[1:]) for _ in range(n)]
ans = 0

for s in combinations(range(1, d + 1), k):
    cnt = 0
    for numSet in stu:
        if numSet - set(s) == set():
            cnt += 1

    ans = max(ans, cnt)
print(ans)