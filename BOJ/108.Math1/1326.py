# 폴짝폴짝
# 시간 : 5시간
# 구현 아이디어 : bfs + dp -> 포인트는 종료조건이 없어도 된다는 점

import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
bridge = list(map(int, input().split()))
a, b = map(int, input().split())
dp = [10001] * n
    
def bfs(a):
    dp[a] = 0
    q = deque()
    q.append([a, 0])
    while q:
        s, cnt = q.popleft()
        for i in range(s + bridge[s], n, bridge[s]):
            if dp[i] == 10001:
                dp[i] = cnt + 1
                q.append([i, cnt + 1])
        for i in range(s - bridge[s], -1, -bridge[s]):
            if dp[i] == 10001:
                dp[i] = cnt + 1
                q.append([i, cnt + 1])
def solution():
    bfs(a - 1)
    if dp[b - 1] == 10001:
        print(-1)
    else:
        print(dp[b - 1])
solution()

# dfs 실패
# def dfs(round, cnt):
#     if not visited:
#         return
#     if abs(b - 1 - round) >= bridge[round] and abs(b - 1 - round) % bridge[round] == 0:
#         dp[round] = cnt + 1
#         return
#     else:
#         for i in range(round, n, bridge[round]):
#             if not visited[i]:
#                 if abs(i - round) >= bridge[round] and abs(i - round) % bridge[round] == 0:
#                     dfs(i, cnt + 1)
#         for i in range(round, -1, -bridge[round]):
#             if not visited[i]:
#                 if abs(i - round) >= bridge[round] and abs(i - round) % bridge[round] == 0:
#                     dfs(i, cnt + 1)


# def bfs(i, cnt):
#     q = deque()
#     q.append(i)
#     while q:
#         round = q.pop()
#         cnt += 1
#         d1 = abs(b - round)
#         if d1 >= bridge[round] and d1 % bridge[round] == 0:
#             dp[round] = cnt
#         else:
#             for i in range(1, n):
#                 if not visited[i]:
#                     d2 = abs(i - round) 
#                     if d2 >= bridge[round] and d2 % bridge[round] == 0:
#                         visited[i] = 1
#                         q.append(i)

# Test Case 
# 5
# 3 4 8 2 1
# 1 5

# 답 : -1

# 1
# 1
# 1 1

# 답 : 0

# 8
# 4 4 6 1 3 2 5 4
# 2 3

# 답 : 3

# 8
# 1 4 6 3 3 2 5 5
# 2 3

# 답 : 3

# 3
# 5 5 5
# 2 3

# -1

# 10000
# 10000 1
# 1 2

# 답 : -1

# 3
# 2 1 2
# 1 2

# 답 : -1
