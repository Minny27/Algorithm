# 감소하는 수
# 구현 아이디어: 조합

import sys
from itertools import combinations

n = int(sys.stdin.readline())

for i in range(1, 11):
    nDigitNumList = list(combinations("9876543210", i))[::-1]
    if n < len(nDigitNumList):
        print("".join(nDigitNumList[n]))
        quit()
    else:
        n -= len(nDigitNumList)
print(-1)