# 일루미네이션
# 구현 아이디어 : 6각형을 확인하기 위해서 테두리를 둘러서 g를 생성하고, 0을 기준으로 1을 세기
# 이어진 곳에서 왼쪽과 가운데, 그리고 오른쪽을 나누어서 셈

import sys
input = sys.stdin.readline
w, h = map(int, input().split())
di = [1, -1, 0, 0] 
dj = [0, 0, 1, -1]
g = list() # graph
g.append([0] * 8)
for i in range(h):
    g.append([0] + list(map(int, input().split())) + [0])
g.append([0] * 8)
print(g)

def bfs():
    


bfs()