# 빙고

import sys
input = sys.stdin.readline
g = [list(map(int, input().split())) for _ in range(5)]
q = [list(map(int, input().split())) for _ in range(5)]
visited = [[0 for _ in range(5)] for _ in range(5)]
matrix = set()
ans = 0
correctHt = (((0,0),(0,1),(0,2),(0,3),(0,4)),
            ((1,0),(1,1),(1,2),(1,3),(1,4)),
            ((2,0),(2,1),(2,2),(2,3),(2,4)),
            ((3,0),(3,1),(3,2),(3,3),(3,4)),
            ((4,0),(4,1),(4,2),(4,3),(4,4)),
            ((0,0),(1,0),(2,0),(3,0),(4,0)),
            ((0,1),(1,1),(2,1),(3,1),(4,1)),
            ((0,2),(1,2),(2,2),(3,2),(4,2)),
            ((0,3),(1,3),(2,3),(3,3),(4,3)),
            ((0,4),(1,4),(2,4),(3,4),(4,4)),
            ((0,0),(1,1),(2,2),(3,3),(4,4)),
            ((4,0),(3,1),(2,2),(1,3),(0,4)))
for k in range(5):
    for v in range(5):
        corretLine = 0
        ans += 1
        for i in range(5):
            for j in range(5):
                if q[k][v] == g[i][j]:
                    visited[i][j] = 1
                    matrix.add((i, j))
        for line in correctHt:
            tmp = matrix.intersection(line) 
            if set(tmp) == set(line):
                corretLine += 1
        if corretLine >= 3:
            print(ans)
            quit(0)
