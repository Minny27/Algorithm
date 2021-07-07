import sys
from heapq import heappush, heappop
n = int(input())
ans = [0] * (1001)
hq = []
for i in range(n):
    day, score = map(int, input().split())
    heappush(hq, [-score, day])
while hq:
    score, day = heappop(hq)
    for j in range(day, 0, -1):
        if ans[j] == 0:
            ans[j] = score
            break
print(abs(sum(ans)))