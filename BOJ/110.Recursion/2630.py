# 색종이 만들기
# 구현 아이디어 : 4분할로 재귀를 돌리는데 graph[ii][jj] 값과 다를 때만 4개의 분면으로 나누기

import sys

def main():
    n = int(sys.stdin.readline().strip())
    graph = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
    nW = [0]
    nB = [0]

    def solution(ii, jj, l):
        check = graph[ii][jj]
        for i in range(ii, ii + l):
            for j in range(jj, jj + l):
                if check != graph[i][j]:
                    solution(ii, jj, l // 2)
                    solution(ii, jj + l // 2, l // 2)
                    solution(ii + l // 2, jj, l // 2)
                    solution(ii + l // 2, jj + l // 2, l // 2)
                    return
        if check == 0:
            nW[0] += 1
        else:
            nB[0] += 1
    solution(0, 0, n)
    print(nW[0])
    print(nB[0])
main()