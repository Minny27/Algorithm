# 말이 되고픈 원숭이
# 구현 아이디어 : visited[i][j][k - 1]에 말의 움직임을 k번 사용할 수 있을 때 이전 위치(visited[i][j][k]) + 1 을 저장
# 왜 일반 움직임을 먼저하고 말 움직임을 처리하는 것이 더 빠른지는 모르겠다..
# 비슷한 문제 : 벽 부수고 이동하기

import sys
from collections import deque
input = sys.stdin.readline
k = int(input())
w, h = map(int, input().split()) # 가로(j) 세로(i)
g = [list(map(int, input().split())) for _ in range(h)]
visited = [[[0] * 31 for _ in range(w)] for _ in range(h)]
# visited=[[[0 for _ in range(w)] for _ in range(h)] for _ in range(k+1)] # 3차원 visited를 이렇게 쓸 수도 있구나..
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]
hi = [2, 1, 2, 1, -1, -2, -1, -2]
hj = [1, 2, -1, -2, 2, 1, -2, -1]

# 가장자리 인덱스 처리
def boundary(i, j):
    return 0 <= i < h and 0 <= j < w

def bfs(k):
    q = deque()
    q.append([0, 0, k]) 
    while q:
        i, j, k = q.popleft()
        if h == i + 1 and w == j + 1:
            return visited[i][j][k]
        for t in range(4):
            ii = di[t] + i
            jj = dj[t] + j
            if boundary(ii, jj) and g[ii][jj] != 1 and not visited[ii][jj][k]:
                visited[ii][jj][k] = visited[i][j][k] + 1
                q.append([ii, jj, k])
        if k > 0:
            for t in range(8):
                hii = hi[t] + i
                hjj = hj[t] + j
                if boundary(hii, hjj) and g[hii][hjj] != 1 and not visited[hii][hjj][k - 1]:
                    visited[hii][hjj][k - 1] = visited[i][j][k] + 1
                    q.append([hii, hjj, k - 1])
    return -1
print(bfs(k))

# Test Case

# 2
# 4 4
# 0 0 0 0
# 1 0 0 0
# 0 0 1 0
# 0 1 0 0

# 답 : 2

# 1
# 5 4
# 0 0 0 0 0
# 0 0 0 1 0
# 0 0 1 1 0
# 0 0 1 1 0

# 답 : 5

# 3
# 5 4
# 0 1 0 0 0
# 1 0 0 0 0
# 0 0 0 0 0
# 0 0 0 0 0

# 답 : 3

# 3
# 5 4
# 0 0 0 0 0
# 1 0 0 0 0
# 0 0 0 0 1
# 0 0 0 1 0

# 답 : 3

# 3
# 5 4
# 0 0 0 0 0
# 1 0 0 1 0
# 0 0 1 0 0
# 0 0 0 0 0

# 답 : 3

# 5
# 5 4
# 0 1 0 0 0
# 1 0 0 1 0
# 0 0 1 0 1
# 0 0 0 1 0

# 답 : -1

# 1
# 5 4
# 0 0 0 0 0
# 1 0 0 1 0
# 0 0 0 0 1
# 0 0 0 1 0

# 답 : 5

# 1
# 4 4
# 0 0 0 0
# 1 0 0 0
# 0 0 1 1
# 0 1 0 0

# 답 : 4

# 5
# 1 1
# 0

# 답 : 0

# 4
# 6 10
# 0 0 1 1 1 1
# 0 1 1 0 1 1
# 0 1 1 1 1 0
# 0 1 1 1 1 0
# 0 1 1 1 1 0
# 0 1 1 1 1 0
# 0 1 1 0 1 1
# 0 1 1 1 1 1
# 1 1 1 1 0 0
# 1 0 0 1 1 0

# 답 10

# 1
# 4 4
# 0 0 1 1
# 0 0 1 1
# 0 0 1 1
# 1 1 1 0
# 4