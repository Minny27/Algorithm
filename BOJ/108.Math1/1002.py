# 터렛
# 구현 아이디어 : 만날 수 있는 개수(0, 1, 2 무한대) 따른 조건 나누기

import math
n = int(input())
ans = []
def distance(x1, y1, x2, y2):
    return math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)

def solution():
    for _ in range(n):
        x1, y1, r1, x2, y2, r2 = list(map(int, input().split()))
        tmp = [r1, r2]
        r1 = r1 > r2 and r1 or tmp[1]
        r2 = r1 > r2 and r2 or tmp[0]
        d = distance(x1, y1, x2, y2)
        if (d + r2 < r1 and r1 > r2) or (d != 0 and d > r1 + r2):
            ans.append(0)
        elif d == 0 and r1 == r2:
            ans.append(-1)
        elif d + r2 == r1 or d == r1 + r2:
            ans.append(1)            
        else:
            ans.append(2)            
    print("\n".join(list(map(str, ans))))
    return
solution()

# 한 원이 다른 원의 내부에 있고 두 원이 만나지 않을 때, 답은 0. 꼭 두 원의 중심이 같을 필요는 없습니다!
# 이것 때문에 몇시간 고민했네...
