# 터렛
import math

    
n = int(input())
ans = [0 for _ in range(n)]

def distance(x1, y1, x2, y2):
    return math.sqrt((x1 - x2) ** 2) + math.sqrt((y1 - y2) ** 2)

for i in range(n):
    x1, y1, r1, x2, y2, r2 = map(int, input().split())
    d = distance(x1, y1, x2, y2)
    # 같은 지점에서 같은 거리에 있을 때 -1
    if d == 0 and r1 == r2:
        ans[i] = -1
    # 같은 지점, 다른 거리에 있을 때 0
    elif d == 0:
        continue
    # 일직선상에 있을 때
    elif d - abs(r1 + r2) == 0:
        ans[i] = 1
    # 일직선 상에 있지 않을 때
    else:
        ans[i] = 2

for i in range(n):
    print(ans[i])
