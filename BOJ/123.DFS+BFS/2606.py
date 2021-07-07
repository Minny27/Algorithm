
# 바이러스

import sys
sys.setrecursionlimit(10000)
input = sys.stdin.readline
vN = int(input()) # vertex num
eN = int(input()) # edge num
# visited = [[0 for _ in range(5051)] for _ in range(5051)]
visited = set()
ans = set()
v = [[] for _ in range(vN + 1)]
for i in range(1, eN + 1):
    tmp = list(map(int, input().split()))
    v[tmp[0]].append(tmp[1])
    v[tmp[1]].append(tmp[0])
joint = v[1]
def dfs(n, idx):
    if idx >= len(v[n]): 
        return
    if v[n][idx] not in visited:
        visited.add(v[n][idx])
        # visited[n][v[n][idx]] = 1
        # visited[v[n][idx]][n] = 1
        # if v[n][idx] == 1:
        #     ans.add(n)
        # else:
        #     ans.add(v[n][idx])
        dfs(n, idx + 1)
        dfs(v[n][idx], 0)
# for i in range(1, vN + 1):
for i in joint:
    dfs(i, 0)
print(len(visited) - 1)

