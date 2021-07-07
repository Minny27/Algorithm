# 스택

import sys

input = sys.stdin.readline
n = int(input())

def solution(n):
    ans = []
    stack = list()
    for i in range(n):
        action = list(map(str, input().split()))
        if action[0].find("pu") != -1:
            stack.append(action[1])
        elif action[0].find("po") != -1:
            if len(stack) == 0:
                ans.append(-1)
            else:
                ans.append(stack.pop())
        elif action[0].find("s") != -1:
            ans.append(len(stack))
        elif action[0].find("e") != -1:
            if len(stack) == 0:
                ans.append(1)
            else:
                ans.append(0)
        elif action[0].find("t") != -1:
            if len(stack) == 0:
                ans.append(-1)
            else:
                ans.append(stack[len(stack) - 1])
    print("\n".join(map(str, ans)))
solution(n)