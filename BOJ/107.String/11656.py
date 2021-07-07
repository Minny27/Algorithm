# 접미사 배열

import sys
input = sys.stdin.readline
s = input()

def solution():
    arr = []
    for i in range(len(s) - 1):
        arr.append(s[i:])
    arr.sort()
    print("".join(arr))
solution()