# 빙산
# 구현 아이디어 : DFS 방식 시간초과 -> BFS로 전환
# BFS 방식으로 주변이 0 이면 0 개수만큼 빼주고 한 번 BFS가 돌때 마다 numOfIce를 1씩 증가
# numOfIce가 2이상이 되면 그 순간 ans(시행 횟수)를 출력하고 끝낸다.
# 종료 조건 : 루프를 돌 때마다 0의 개수가 (n - 2) * (m - 2)이거나 numOfIce가 2이상일 때
# bfs도 런타임 에러가 발생했지만,,, pypy3으로 돌리면 돌아갔다... 종료조건이 중요한듯하다.

# visited = [[0] * m] * n -> 이런 형식은 2차원에서 인덱스로 접근할 때 중복될 수 있어 1차원일 때만 사용하기

# import sys
# sys.setrecurionlimit(10 ** 6)

n, m = list(map(int, input().split())) # 행 열
map = [list(map(int, input().split())) for _ in range(n)]
di = [1, -1, 0, 0] # 행(아래 위)
dj = [0, 0, 1, -1] # 열(오 왼)
ans = 0 # 시행 횟수
# print(map)

def bfs(i, j):
    visited[i][j] = 1
    q = [(i,j)] # 큐에 좌표를 저장
    while len(q) != 0:
        vi = q[0][0] # 해당 노드의 행
        vj = q[0][1] # 해당 노드의 열
        q.pop(0)
        for z in range(4):
            ii = vi + di[z]
            jj = vj + dj[z]
            if visited[ii][jj] == 0:
                if map[ii][jj] != 0:
                    visited[ii][jj] = 1
                    q.append((ii,jj))
                else:
                    if map[vi][vj] != 0:
                        map[vi][vj] -= 1
    return 1

    

while 1:
    visited = [[0 for c in range(m)] for r in range(n)] # 방문 체크
    numOfIce = 0 # 분리되는 개수
    cnt = 0 # 전체 0의 개수 -> 끝내는 조건
    for i in range(1, n - 1):
        for j in range(1, m - 1):
            if visited[i][j] == 0 and map[i][j] != 0:
                numOfIce += bfs(i, j) # bfs 시행횟수 -> 덩어리 갯수
            elif map[i][j] == 0:
                cnt += 1
    if numOfIce > 1:
        print(ans)
        break
    elif cnt == (n - 2) * (m - 2):
        print(0)
        break
    ans += 1

# DFS로 짠 코드 런타임 에러 발생...
# def dfs(i, j):
#     if flag[i][j] == 1: 
#         return
#     flag[i][j] = 1
#     if map[i][j] == 0:
#         return
#     for z in range(4): 
#         ii = i + di[z]
#         jj = j + dj[z]
#         # if 0 <= ii < n and 0 <= jj < m:
#         if map[ii][jj] == 0:
#             map[i][j] -= 1
#             # 0보다 작은 값이 발생하지 않도록 하는 조건
#             if map[i][j] <= 0:
#                 map[i][j] = 0
#                 flag[i][j] = 1
#             continue
#         elif map[ii][jj] != 0 and flag[ii][jj] == 0:
#             dfs(ii, jj)
#     return 1

# Test Case
# 5 7
# 0 0 0 0 0 0 0
# 0 2 4 5 3 0 0
# 0 3 0 2 5 2 0
# 0 7 6 2 4 0 0
# 0 0 0 0 0 0 0

# 답 : 2

# 5 7
# 0 0 0 0 0 0 0
# 0 2 2 2 2 0 0
# 0 2 0 0 0 2 0
# 0 2 2 2 2 0 0
# 0 0 0 0 0 0 0

# 답 : 0

# 5 7
# 0 0 0 0 0 0 0
# 0 3 3 3 4 0 0
# 0 2 0 0 0 2 0
# 0 2 2 2 2 0 0
# 0 0 0 0 0 0 0

# 답 : 0

# 5 7
# 0 0 0 0 0 0 0
# 0 2 4 5 5 0 0
# 0 3 0 2 5 2 0
# 0 7 6 3 4 0 0
# 0 0 0 0 0 0 0

# 답 : 2

# 5 7 
# 0 0 0 0 0 0 0
# 0 5 2 2 2 5 0
# 0 2 0 50 0 2 0
# 0 5 2 2 2 5 0
# 0 0 0 0 0 0 0

# 답 : 1

# 2 2
# 5 0
# 0 2

# 답 : 0

# 5 7 
# 0 0 0 0 0 0 0
# 0 5 0 5 0 5 0
# 0 0 0 0 0 0 0
# 0 5 0 5 0 5 0
# 0 0 0 0 0 0 0

# 답 : 0

# 5 7 
# 0 0 0 0 0 0 0
# 0 5 5 5 5 5 0
# 0 5 5 5 5 5 0
# 0 5 5 5 5 5 0
# 0 0 0 0 0 0 0

# 답은 0이나 무한 루프...