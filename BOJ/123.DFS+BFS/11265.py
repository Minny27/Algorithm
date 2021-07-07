# 끝나지 않은 파티
# 구현 아이디어 : 2차원 배열에 파티장 간의 걸리는 시간을 넣고
# 다음 줄부터 시작, 끝까지 for문을 돌면서 graph[i][j]를 기준으로 

n, m = list(map(int, input().split()))
graph = [list(map(int, input().split())) for _ in range(n)]

def solution():
    s = ""
    for k in range(n):
        for i in range(n):
            for j in range(n):
                if graph[i][j] > graph[i][k] + graph[k][j]:
                    graph[i][j] = graph[i][k] + graph[k][j]
    for i in range(m):
        a, b, c = list(map(int, input().split()))
        if c >= graph[a - 1][b - 1]:
            s += "Enjoy other party\n"
        else:
            s += "Stay here\n"
    print(s)
solution()