import sys
from collections import deque
input = sys.stdin.readline
f, s, g, u, d = map(int, input().split())
visited = [0] * (1000001)
d = [u, -d]

if (s > g and d == 0) or (s < g and u == 0):
    print("use the stairs")
    exit()

def bfs(f, s, g, u, d):
    q = deque()
    q.append([s, 0])
    while q:
        s, cnt = q.popleft()
        if visited[s]:
            continue
        visited[s] = 1
        if s == g:
            print(cnt)
            exit()
        for k in range(2):
            ns = s + d[k]
            if ns > f or ns < 1:
                continue
            if not visited[ns]:
                q.append([ns, cnt + 1])
    print("use the stairs")
bfs(f, s, g, u, d)