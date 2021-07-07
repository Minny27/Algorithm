# -*- coding: utf-8 -*-

# 전단지 돌리기
# 시간 :1시간 30분
# 구현 아이디어 : dfs
# 1) s노드를 기준으로 깊이가 깊어질 때마다 cnt + 1
# 2) 리프 노드에 도달했을 때 leaf와 d를 비교해서 작으면 cnt - 1, leaf + 1
# 3) 그 이외에는 cnt + 1로 cnt를 갱신

import sys
sys.setrecursionlimit(10 ** 6)
input = sys.stdin.readline
n, s, d = map(int, input().split())
g = [[] for _ in range(n + 1)]
visited = [0 for _ in range(n + 1)]
ans = 0 # 답
leaf = 0 # 리프 노드
for i in range(n - 1):
    a, b = map(int, input().split())
    g[a].append(b)
    g[b].append(a)

def dfs(start, cnt):
    global leaf
    leaf = 0
    if visited[start]:
        return cnt
    visited[start] = 1
    if start != s:
        cnt += 1
    for adj in g[start]:
        cnt = dfs(adj, cnt)
    if start == s:
        return cnt
    if leaf < d:
        cnt -= 1
        leaf += 1
    else:
        cnt += 1
    return cnt

ans += dfs(s, 0)
print(ans)

# Test Case
# 6 1 0
# 1 2
# 1 4
# 2 3
# 3 5
# 3 6

# 답 :
# 10

# 6 1 1
# 1 2
# 1 4
# 2 3
# 2 5
# 5 6

# 답 : 
# 4
# 6 1 6
# 1 2
# 1 4
# 2 3
# 2 5
# 5 6

# 답 : 
# 0

# 6 1 5
# 1 2
# 1 4
# 2 3
# 2 5
# 5 6

# 답 : 
# 0

# 6 1 1
# 1 2
# 2 3
# 3 4
# 4 5
# 5 6

# 답 : 
# 8

# 6 1 0
# 1 2
# 2 3
# 3 4
# 4 5
# 5 6

# 답 : 
# 10

# 6 1 5
# 1 2
# 2 3
# 3 4
# 4 5
# 5 6

# 답 : 
# 0

# 6 1 4
# 1 2
# 2 3
# 3 4
# 4 5
# 5 6

# 답 : 
# 2

# 6 1 0
# 1 2
# 1 3
# 1 4
# 1 5
# 1 6

# 답 :
# 10
