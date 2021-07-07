# -*- coding: utf-8 -*-

# 인구 이동
# 시간: 2시간
# 구현 아이디어 : while + bfs
# 1) 노드의 방문 여부와 boundary 체크
# 2) 현재 위치와 인접위치의 절대값이 l, k 범위 내에 있는지 확인
# 3) 인구 이동이 가능한 나라 개수(cnt) 의 개수가 1개이면 0을 리턴
# 4) 그 외에는 평균을 구해서 연합번호에 해당하는 노드만 평균값으로 갱신
# 5) 한 번이라도 인구 이동이 일어나면 ans += 1 아니면 ans 출력
# 1 ~ 5 과정 반복
import sys
from collections import deque
input = sys.stdin.readline
n, l, r = map(int, input().split())
g = [list(map(int, input().split())) for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
ans = 0 # 인구이동 횟수

def boundary(i, j):
    return 0 <= i < n and 0 <= j < n

def bfs(i, j):
    global nn
    sum = g[i][j] # 부분합
    cnt = 1 # 인구 이동이 가능한 나라 개수
    q = deque()
    q.append([i, j])
    while q:
        i, j = q.popleft()
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if boundary(ii, jj) and not visited[ii][jj]:
                if l <= abs(g[i][j] - g[ii][jj]) <= r:
                    visited[i][j] = nn
                    visited[ii][jj] = nn
                    q.append([ii, jj])
                    cnt += 1
                    sum += g[ii][jj]
    if cnt == 1:
        visited[i][j] = -1
        return 0
    avg = sum // cnt
    for i in range(n):
        for j in range(n):
            if visited[i][j] == nn:
                g[i][j] = avg
    nn += 1
    return 1

while 1:
    visited = [[0 for _ in range(n)] for _ in range(n)]
    nn = 1 # 연합 넘버
    check = 0 # 전체 나라를 보면서 인구 이동이 한 번 이라도 일어난 경우 체크
    for i in range(n):
        for j in range(n):
            if not visited[i][j]:
                if bfs(i, j):
                    check = 1
    if not check:
        print(ans)
        quit(0)
    else:
        ans += 1

# 4 10 20
# 10 20 10 20
# 50 10 50 60
# 60 50 60 50
# 50 60 50 60