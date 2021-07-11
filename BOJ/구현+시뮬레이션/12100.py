# 2048(Easy)
# 시간 : 3시간

# # 방향 -> 0 : 북, 1 : 남, 2 : 서, 3 : 동
from itertools import product
import sys, copy
input = sys.stdin.readline
n = int(input())
g = [list(map(int, input().split())) for _ in range(n)]
totalCase = list(product(range(4), range(4), range(4), range(4), range(4))) # 중복순열
maxValue = 0 # 답

for case in totalCase:
    gCopy = copy.deepcopy(g) # 보드지 복사
    for d in case:
        isMerged = [[0 for _ in range(n)] for _ in range(n)] # 해당 블록이 병합이 됐는지 안 됐는지 확인하는 2차원 배열
        # 북
        if d == 0:
            for j in range(n):
                for i in range(1, n):
                    for k in range(i - 1, -1, -1):
                        # 이미 병합한 경우
                        if isMerged[k][j]:
                            break
                        # 0을 만났을 때
                        if gCopy[k][j] == 0:
                            gCopy[k][j] = gCopy[k + 1][j]
                            gCopy[k + 1][j] = 0
                            continue
                        # 병합할 수 있는 경우
                        if gCopy[k][j] == gCopy[k + 1][j]:
                            isMerged[k][j] = 1
                            gCopy[k][j] = gCopy[k + 1][j] * 2
                            gCopy[k + 1][j] = 0
                            break
                        # 그 이외의 경우
                        else:
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
                        else:
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
                        else:
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
                        else:
                            break
    # 해당 케이스에서의 최대값 구하기
    for i in range(n):
        for j in range(n):
            if maxValue < gCopy[i][j]:
                maxValue = gCopy[i][j]
print(maxValue)