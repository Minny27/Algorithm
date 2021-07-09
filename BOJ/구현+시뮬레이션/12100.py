

# 2048(Easy)
# 시간 : 3시간
# 0 : 북, 1 : 남, 2 : 서, 3 : 동

from itertools import product
import sys, copy
input = sys.stdin.readline
n = int(input())
g = [list(map(int, input().split())) for _ in range(n)]
permu = list(product(range(4), range(4), range(4), range(4), range(4))) # 중복순열
maxValue = 0

for dArr in permu:
    gCopy = copy.deepcopy(g)
    for d in dArr:
        isMerged = [[0 for _ in range(n)] for _ in range(n)]
        # 북
        if d == 0:
            for j in range(n):
                for i in range(1, n):
                    for k in range(i - 1, -1, -1):
                        if isMerged[k][j]:
                            break
                        if gCopy[k][j] == 0:
                            gCopy[k][j] = gCopy[k + 1][j]
                            gCopy[k + 1][j] = 0
                            continue
                        if gCopy[k][j] == gCopy[k + 1][j]:
                            isMerged[k][j] = 1
                            gCopy[k][j] = gCopy[k + 1][j] * 2
                            gCopy[k + 1][j] = 0
                            break
        # 남
        if d == 1:
            for j in range(n):
                for i in range(n - 2, -1, -1):
                    for k in range(i + 1, n):
                        if isMerged[k][j]:
                            break
                        if gCopy[k][j] == 0:
                            gCopy[k][j] = gCopy[k - 1][j]
                            gCopy[k - 1][j] = 0
                            continue
                        if gCopy[k][j] == gCopy[k - 1][j]:
                            isMerged[k][j] = 1
                            gCopy[k][j] = gCopy[k - 1][j] * 2
                            gCopy[k - 1][j] = 0
                            break

        # 서                    
        if d == 2:
            for i in range(n):
                for j in range(1, n):
                    for k in range(j - 1, -1, -1):
                        if isMerged[i][k]:
                            break
                        if gCopy[i][k] == 0:
                            gCopy[i][k] = gCopy[i][k + 1]
                            gCopy[i][k + 1] = 0
                            continue
                        if gCopy[i][k] == gCopy[i][k + 1]:
                            isMerged[i][k] = 1
                            gCopy[i][k] = gCopy[i][k + 1] * 2
                            gCopy[i][k + 1] = 0
                            break
        # 동                    
        if d == 3:
            for i in range(n):
                for j in range(n - 2, -1, -1):
                    for k in range(j + 1, n):
                        if isMerged[i][k]:
                            break
                        if gCopy[i][k] == 0:
                            gCopy[i][k] = gCopy[i][k - 1]
                            gCopy[i][k - 1] = 0
                            continue
                        if gCopy[i][k] == gCopy[i][k - 1]:
                            isMerged[i][k] = 1
                            gCopy[i][k] = gCopy[i][k - 1] * 2
                            gCopy[i][k - 1] = 0
                            break

    for i in range(n):
        for j in range(n):
            if maxValue < gCopy[i][j]:
                maxValue = gCopy[i][j]
print(maxValue)