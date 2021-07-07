# -*- coding: utf-8 -*-

# 보스몬스터 전리품
# 시간 : 2시간
# 구현 아이디어 : BFS + sort
# 처음에는 플레이어의 위치를 큐에 한 번에 넣어서 하려고 했지만, 해시를 써야하는 점과
# 큐에서 한 플레이어가 이미 보스를 찾았음에도 계속 큐가 돌아갈 수 있다는 점 때문에 구현이 힘들다고 판단
# 1) 두 해시 테이블 생성 player -> [플레이어 이름] : [좌표(i, j)], ht -> [플레이어 이름] : [보스까지 걸리는 시간, 플레이어의 dps]
# 2) player 해시테이블에 있는 플레이어마다 bfs를 돌면서 ht 해시테이블을 갱신
# 3) 시간을 오름차순으로 ht 해시테이블을 정렬
# 4) while문을 돌면서 hp를 감소시키고 ans set에 보스를 잡을 때까지 보스까지 도착한 플레이어의 이름을 저장
import sys
from collections import deque
input = sys.stdin.readline
n, m, p = map(int, input().split())
player = {} # 플레이어의 첫 위치 좌표
g = [list(map(str, list(input().strip()))) for _ in range(n)]
for i in range(n):
    for j in range(m):
        if str.islower(g[i][j]):
            player[g[i][j]] = [i, j]
ht = {} # [플레이어의 보스몹까지의 최소거리, dps]
for i in range(p):
    id, dps = input().strip().split()
    ht[id] = [0, int(dps)]
hp = int(input())
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
ans = set() # 전리품을 얻을 수 있는 플레이어 저장

def boundary(i, j):
    return 0 <= i < n and 0 <= j < m

def bfs(nowPlayer, i, j):
    q = deque()
    q.append([0, i, j])
    visited = [[0 for _ in range(m)] for _ in range(n)] # visited를 사용하지 않으면 메모리 초과..
    visited[i][j] = 1
    while q:
        t, i, j = q.popleft() # 걸리는 시간, 좌표(i, j)
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if boundary(ii, jj) and not visited[ii][jj]:
                visited[ii][jj] = 1
                # 보스를 찾았다면 종료
                if g[ii][jj] == 'B':
                    ht[nowPlayer][0] = t + 1 # c : [1, 39]
                    return
                # 벽이 아니라면 큐에 추가
                if g[ii][jj] != 'X':
                    q.append([t + 1, ii, jj])

for k, v in player.items():
    i, j = v[0], v[1]
    bfs(k, i, j)
# 시간을 줄이기 위해서 시간이 작은 플레이어를 기준으로 정렬
ht = sorted(ht.items(), key = lambda k : k[1])

totalTime = 1 # 전체 게임 시간
while hp > 0:
    for i in range(p):
        playName, t, dps = ht[i][0][0], ht[i][1][0], ht[i][1][1]
        # 전체 게임 시간보다 작거나 같은 시간에 이미 도착한 플레이어는 set에 추가 후, hp 감소시키기
        # hp가 0이하가 될 때까지 반복
        if t <= totalTime:
            if not playName in ans:
                ans.add(playName)
            hp -= dps
        else:
            break
    totalTime += 1
print(len(ans))

# Test Case
# 1 3 1
# aB.
# a 15
# 10

# 1 4 2
# aB.b
# a 14
# b 15
# 15

# 3 6 2
# aXXXXB
# .....b
# ......
# a 2
# b 1
# 7

# 답 : 2

# 3 6 2
# aXXXXB
# .....b
# ......
# a 2
# b 1
# 6

# 답 : 1