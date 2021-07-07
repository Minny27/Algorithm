# 큐 2

from sys import stdin
from collections import deque
input = stdin.readline
n = int(input())

def solution(n):
    queue = deque()
    ans = []
    for _ in range(n):
        command = list(map(str, input().split()))
        if command[0] == "push":
            queue.append(command[1])
        elif command[0] == "pop":
            if queue:
                ans.append(queue.popleft())
            else:
                ans.append("-1")
        elif command[0] == "size":
            ans.append(len(queue))
        elif command[0] == "empty":
            if queue:
                ans.append("0")
            else:
                ans.append("1")
        elif command[0] == "front":
            if queue:
                ans.append(queue[0])
            else:
                ans.append("-1")
        elif command[0] == "back":
            if queue:
                ans.append(queue[-1])
            else:
                ans.append("-1")
    print("\n".join(map(str, ans)))
solution(n)

