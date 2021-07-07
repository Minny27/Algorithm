# 팔

import sys
input = sys.stdin.readline
l, r = input().split()

def solution():
    ans = 0
    if len(l) != len(r):
        print(0)
        return
    for i in range(len(r)):
        if l[i] == r[i] == '8':
            ans += 1
        elif l[i] == r[i]:
            continue
        else:
            break
    print(ans)
solution()
