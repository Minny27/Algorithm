# 주사위 굴리기
# 시간 : 2시간 반
# 1: 동(오) 2: 서(왼) 3: 북(위) 4: 남(밑)
# 구현 아이디어 : 동, 서, 남, 북 명령을 일일이 값을 바꾸는 방식으로 구현
# 그리고 g(graph)에 원소 값이 0이라면 주사위의 밑면을 g에 복사, 
# 0이 아니라면 g에서의 원소 값을 주사위에 복사 후 0으로 변경

import sys
input = sys.stdin.readline
n, m, x, y, k = map(int, input().split())
g = [list(map(int, input().split())) for _ in range(n)] # graph
cmd = list(map(int, input().split())) # command

def solution(x, y):
    dice = [0, 0, 0, 0, 0, 0]
    past = dice[:]
    ans = []
    for i in range(k):
        if cmd[i] == 1:
            y += 1
            if 0 <= y < m:
                dice[3] = past[5]
                dice[0] = past[3]
                dice[2] = past[0]
                dice[5] = past[2]
                if g[x][y]:
                    dice[5] = g[x][y]
                    g[x][y] = 0
                else:
                    g[x][y] = dice[5]
                past = dice[:]
                ans.append(dice[0])
            else:
                y -= 1
        if cmd[i] == 2:
            y -= 1
            if 0 <= y < m:
                dice[2] = past[5]
                dice[0] = past[2]
                dice[3] = past[0]
                dice[5] = past[3]                
                if g[x][y]:
                    dice[5] = g[x][y]
                    g[x][y] = 0
                else:
                    g[x][y] = dice[5]
                past = dice[:]
                ans.append(dice[0])
            else:
                y += 1
        if cmd[i] == 3:
            x -= 1
            if 0 <= x < n:
                dice[4] = past[5]
                dice[0] = past[4]
                dice[1] = past[0]
                dice[5] = past[1]                  
                if g[x][y]:
                    dice[5] = g[x][y]
                    g[x][y] = 0
                else:
                    g[x][y] = dice[5]
                past = dice[:]
                ans.append(dice[0])
            else:
                x += 1
        if cmd[i] == 4:
            x += 1
            if 0 <= x < n:
                dice[1] = past[5]
                dice[0] = past[1]
                dice[4] = past[0]
                dice[5] = past[4]                   
                if g[x][y]:
                    dice[5] = g[x][y]
                    g[x][y] = 0
                else:
                    g[x][y] = dice[5]
                past = dice[:]
                ans.append(dice[0])
            else:
                x -= 1
    print("\n".join(list(map(str, ans))))
solution(x, y)
