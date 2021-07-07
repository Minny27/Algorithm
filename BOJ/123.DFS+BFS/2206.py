# 벽 부수고 이동하기
# 구현 아이디어 : bfs + dp
# visited[0][0][0]에는 벽이 한번이라도 뚫렸을 경우를 저장, visited[0][0][1]은 한 번도 안 뚫렸을 때를 저장
# 그리고 0이 아닌 값이 저장되어 있다는 것은 최단 거리라는 의미 -> visited 처리
# 띄어쓰기가 없고 0이 포함된 입력은 string형태로 하나씩 받아서 다시 하나씩 정수로 바꾸기

import sys
from collections import deque
input = sys.stdin.readline
n, m = map(int, input().split())
g = [list(map(int, list(input().strip()))) for _ in range(n)]
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def bfs():
  visited = [[[0] * 2 for _ in range(m)] for _ in range(n)] # 방문 여부와 dp로 사용할 수 있는 3차원 배열
  q = deque()
  q.append([0, 0, 1])
  visited[0][0][1] = 1
  while q:
    i, j, w = q.popleft() # w(wall)은 현재 벽을 부술 수 있는 횟수
    if i + 1 == n and j + 1 == m:
      return visited[i][j][w]
    for k in range(4):
      ii = di[k] + i
      jj = dj[k] + j
      if 0 <= ii < n and 0 <= jj < m:
        # 인접한 값이 1이면서 벽을 부술 수 있는 경우 -> 인접한 값이 1인데 벽을 부술 수 없다면 아무런 행위를 하지 않음.
        if g[ii][jj] == 1 and w == 1:
          visited[ii][jj][0] = visited[i][j][1] + 1 # 현재의 위치(ii, jj)의 0번째 인덱스에 이전 위치(i, j)의 1번째 인덱스의 값 + 1 저장
          q.append([ii, jj, 0])
        # 인접한 값이 0인 경우 -> 이미 벽을 부쉈다면 이전 조건에서 w가 0이 되었을 것이고 부수지 않았다면 w가 1일 것
        elif g[ii][jj] == 0 and visited[ii][jj][w] == 0: # 해당 인덱스에 값이 채워져있다면 먼저 방문한 것 -> 먼저 방문한 값이 최단거리
          visited[ii][jj][w] = visited[i][j][w] + 1 # 벽을 부쉈다면 w = 0 이고 0번째 인덱스에 (이전위치의 값 + 1)을 저장, 부수지 않았다면 w = 1 이고 1번째 인덱스에 (이전위치의 값 + 1)을 저장
          q.append([ii, jj, w])
  return -1
print(bfs())

# Test Case
# 6 4
# 0100
# 1110
# 1000
# 0000
# 0111
# 0000

# 답 : 15

# 6 4
# 0000
# 1110
# 1000
# 0011
# 0111
# 0000

# 답 : 11

# 6 4
# 0000
# 1111
# 1001
# 0001
# 0111
# 0000

# 답 : 11

# 4 4
# 0111
# 1111
# 1111
# 1110

# -1

# 5 5
# 00000
# 11101
# 00001
# 01111
# 00010

# 답 : 15