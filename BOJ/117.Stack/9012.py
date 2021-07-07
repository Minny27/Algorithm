# 괄호
import sys
from collections import deque
input = sys.stdin.readline
n = int(input())

def solution():
    ans = []
    for i in range(n):
        s = deque() # stack
        arr = list(map(str, input().strip()))
        for j in range(len(arr)):
            if arr[j] == '(':
                s.append('(')
                if j == len(arr) - 1:
                    ans.append("NO")
                    break
                continue
            if arr[j] == ')' and len(s) == 0:
                ans.append("NO")
                break
            elif arr[j] == ')' and s[len(s) - 1] == '(':
                s.pop()
                if j == len(arr) - 1 and len(s) == 0:
                    ans.append("YES")
                    break
                elif j == len(arr) - 1 and len(s) != 0:
                    ans.append("NO")
                    break
    print("\n".join(list(map(str, ans))))
solution()