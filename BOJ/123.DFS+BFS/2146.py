# 다리 만들기
# 시간 : 3시간
# 구현 아이디어 : 
# 1) 먼저 continentNumbering 함수로 대륙을 넘버링해주기(graph를 visited로 사용할 수도 있을 거같아서 -로 넘버링함)
# 2) 전체 맵을 방문하면서 한 대륙마다 있는 모든 지점들을 큐에 넣기
# 3) 둘러쌓여있는 부분을 차례 차례로 큐에 넣기
# 4) 해당 큐 사이즈가 끝나면 cnt 를 1 증가
# 5) 다른 대륙에 도달하면 ans 와 cnt를 비교해서 큰 값을 리턴

# 구현이 어려웠던 부분 : 처음에는 0을 기준으로 시작해야한다고 생각했던 부분에서 좀 에러가 있었고
# visited를 하지 않으면 메모리초과가 발생했는데, 문제에서 무조건 2개 이상의 대륙을 입력으로 주어진다고 했는데 
# 왜 visited가 없으면 메모리 초과가 발생하는지 아직도 모르겠습니다..

import sys
from collections import deque
input = sys.stdin.readline
n = int(input())
g = [list(map(int, input().split())) for _ in range(n)] # graph
visited = [[0 for _ in range(n)] for _ in range(n)] # 방문 여부
di = [1, -1, 0 ,0]
dj = [0, 0, 1, -1]
cNum = -1 # continent number
ans = sys.maxsize # 정답

# 맵(g)의 범위를 넘어가는 경우
def boundary(i, j):
    return 0 <= i < n and 0 <= j < n

# 대륙의 번호를 매기는 함수 -> bfs 방식
def continentNumbering(i, j):
    q = deque()
    q.append([i, j])
    visited[i][j] = 1
    g[i][j] = cNum
    while q:
        i, j = q.popleft()
        for k in range(4):
            ii = i + di[k]
            jj = j + dj[k]
            if boundary(ii, jj) and not visited[ii][jj] and g[ii][jj] == 1:
                visited[ii][jj] = 1
                g[ii][jj] = cNum
                q.append([ii, jj])

# 대륙마다 다리의 최소길이를 세는 함수 -> bfs방식
def bfs(cNum):
    global ans
    q = deque()
    cnt = 0 # 한 대륙에서 다른 대륙까지의 길이
    # 해당 대륙 번호에 해당하는 좌표를 큐에 넣기
    for i in range(n):
        for j in range(n):
            if g[i][j] == cNum:
                q.append([i, j])
    # 큐의 사이즈만큼 for를 돌고 for문이 끝나면 cnt를 1 증가
    while q:
        qSize = len(q)
        for _ in range(qSize):
            i, j = q.popleft()
            for k in range(4):
                ii = i + di[k]
                jj = j + dj[k]
                if boundary(ii, jj):
                    # 다른 대륙에 도착하면 현재의 최소값(ans) 와 비교해서 작은 값을 리턴
                    if g[ii][jj] < 0 and g[ii][jj] != cNum:
                        ans = min(ans, cnt)
                        return
                    elif not visited[ii][jj] and not g[ii][jj]:
                        visited[ii][jj] = 1
                        q.append([ii, jj])
        cnt += 1

# 맵 전체를 방문하면서 대륙에 번호 매기기
for i in range(n):
    for j in range(n):
        if g[i][j] == 1:
            continentNumbering(i, j)
            cNum -= 1

# 각 대륙의 번호를 bfs에 넣기, 대륙마다 visited를 갱신
for i in range(-1, cNum, -1):
    visited = [[0 for _ in range(n)] for _ in range(n)]
    bfs(i)
print(ans)

