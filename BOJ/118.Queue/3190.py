# 뱀
# 시간 : 2시간
# 구현 아이디어 : 데큐
# g(graph)에 아무것도 없을 때 0, 사과 1, 현재 위치 2

import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
g = [[0 for _ in range(n)] for _ in range(n)]
k = int(input())
for i in range(k):
    a, b = map(int, input().split())
    g[a-1][b-1] = 1
l = int(input())
ht = dict()
for i in range(l):
    a, b = map(str, input().strip().split())
    ht[a] = b
d = [[0, 1], [1, 0], [0, -1], [-1, 0]] # direction

def solution(i, j):
    idx = 0 # 방향의 idx
    g[i][j] = 2
    q = deque()
    q.append([i, j])
    t = 0 # time
    while 1:
        t += 1
        i, j = i + d[idx][0], j + d[idx][1] # 현재의 머리 위치
        
        # 인덱스 범위를 넘어갈 때
        if i < 0 or i >= n or j < 0 or j >= n:
            print(t)
            return
        # 사과를 먹었을 때
        if g[i][j] == 1:
            q.append([i, j])
            g[i][j] = 2
        elif g[i][j] == 0:
            q.append([i, j])
            g[i][j] = 2
            tail = q.popleft()
            g[tail[0]][tail[1]] = 0
        else:
            print(t)
            return

        # 방향이 바뀔 때
        kk = str(t)
        if kk in ht.keys():
            if ht[kk] == 'D':
                idx = (idx + 1) % 4
            else:
                idx = (idx - 1) % 4
solution(0, 0)


# def solution(i, j):
#     q = deque()
#     q.append([i, j])
#     idx = 0 # 방향의 idx
#     t = 0 # time
#     while 1:
#         t += 1
#         now = [i + d[idx][0], j + d[idx][1]]
#         # 사과를 먹었을 때
#         if g[now[0]][now[1]] == 1:
#             q.append([now[0], now[1]])
#         else:
#             q.append([now[0], now[1]])
#             q.popleft()


#         # 방향이 바뀔 때
#         if t 

# solution(0, 0)