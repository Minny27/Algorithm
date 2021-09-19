# 로또

import sys
from itertools import combinations

input = sys.stdin.readline
arr = list()
ans = list()

while 1:
    line = list(map(int, input().split()))[1:]
    if line == []:
        break
    ans.append(list(combinations(line, 6)))

for i in range(len(ans)):
    for j in range(len(ans[i])):
        print(" ".join(map(str, ans[i][j])))
    print()
    