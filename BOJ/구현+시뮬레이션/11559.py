# -*- coding: utf-8 -*-

# Puyo Puyo
# 시간 : 1시간 반
# 구현 아이디어 : bfs + 구현
# 어려웠던 점 : 알파벳을 내리는 부분에서 '.' 때만 바꿔야하는데 알파벳끼리도 바꾸게되서 그 부분을 생각하지 못했었음.

from collections import deque
import sys
input = sys.stdin.readline
g = [list(map(str, input().strip())) for _ in range(12)]
d = [[-1, 0], [1, 0], [0, -1], [0, 1]]
# alphabet = ["R", "G", "B", "P", "Y"]
ans = 0 # 총 횟수

def boundary(i, j):
    return 0 <= i < 12 and 0 <= j < 6

def bfs(i, j, alpha):
    q = deque()
    rcSet = set() # 지울 애들 좌표
    cSet = set() # 지울 애들의 열
    q.append([i, j])
    visited[i][j] = 1
    rcSet.add((i, j))
    cSet.add(j)
    while q:
        i, j = q.popleft()
        for k in range(4):
            ni = i + d[k][0]
            nj = j + d[k][1]
            if not boundary(ni, nj):
                continue
            if g[ni][nj] == alpha:
                if not visited[ni][nj]:
                    visited[ni][nj] = 1
                    q.append([ni, nj])
                    rcSet.add((ni, nj))
                    cSet.add(nj)
    # 지울 애들이 4개 이상인 경우만 리턴
    if len(rcSet) >= 4:
        return rcSet, cSet
    # 그 이외는 빈 값 리턴
    else:
        return set(), set()

while 1:
    visited = [[0 for _ in range(6)] for _ in range(12)]
    rowColSet = set() # 지울 애들 좌표
    colSet = set() # 지울 애들의 열좌표(시행횟수를 줄이기 위함)
    # 열 -> 행
    for j in range(6):
        for i in range(11, -1, -1):
            # if g[i][j] != '.' and not g[i][j] in alphabet:
            #     print(0)
            #     quit(0)
            if not visited[i][j] and g[i][j] != '.':
                tmp1, tmp2 = bfs(i, j, g[i][j])
                # 두 셋에 값이 있을 때만 합집합으로 갱신
                if tmp1 and tmp2:
                    rowColSet = rowColSet.union(tmp1)
                    colSet = colSet.union(tmp2)
            # 문제에서 떨어져서 나오는 테스트 케이스는 없다고 했으므로 위로 올라가다가 '.'이 있으면 break
            elif g[i][j] == '.':
                break
    
    # 지울 좌표 set에서 해당 죄표에 '.' 넣기
    for r, c in rowColSet:
        g[r][c] = '.'
    
    # 빈 값을 채워주기
    # 열 -> 행
    for j in colSet:
        for i in range(10, -1, -1):
            if g[i][j] != '.':
                while i < 11 and g[i + 1][j] == '.' :
                    g[i][j], g[i + 1][j] = g[i + 1][j], g[i][j]
                    i += 1

    # 하나도 없는 경우 예외처리
    if ans == 0 and not rowColSet:
        print(0)
        quit(0)
    # 연쇄가 한 번도 안 일어나면 ans 출력
    elif not rowColSet:
        print(ans)
        quit(0)
    # 한 바퀴를 돌면 ans += 1
    ans += 1

