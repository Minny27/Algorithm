# 알렉산드리아의 디오판토스

import sys
input = sys.stdin.readline
n = int(input())

def solution(n):
    ans = ""
    for i in range(1, n + 1):
        k = int(input())
        cnt = 0
        for i in range(k + 1, k * 2 + 1):
            cnt += (i * k) % (i - k) == 0
        ans += "Scenario #" + str(i) + ":\n" + str(cnt) + "\n\n"
    print(ans)
solution(n)