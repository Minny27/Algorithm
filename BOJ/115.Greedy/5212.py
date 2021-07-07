# 지구 온난화
# 구현 아이디어 : 결과 값을 리스트에 복사하고 그 복사한 리스트에서
# 각 행마다 X가 처음 나왔을 때와 마지막으로 나왔을 때를 기록해서 해당 길이 만큼만 출력
# 가운데 ....이 남아있을 때는 포함시켜서 출력해야하는 것을....

import copy

n, m = list(map(int, input().split()))
g = [list(map(str, input())) for _ in range(n)]
gCopy = copy.deepcopy(g)
di = [1, -1, 0, 0]
dj = [0, 0, 1, -1]

def solution():
    ans = ""
    u = 11 # up
    d = -1 # down
    l = 11 # left
    r = -1 # right
    for i in range(n):
        for j in range(m):
            cnt = 0
            if g[i][j] == 'X':
                for k in range(4):
                    ii = i + di[k]
                    jj = j + dj[k]
                    if (ii < 0 or ii >= n) or (jj < 0 or jj >= m):
                        cnt += 1
                    elif g[ii][jj] == '.':
                        cnt += 1
                    if cnt >= 3:
                        gCopy[i][j] = '.'
    for i in range(n):
        for j in range(m):
            if gCopy[i][j] == 'X':
                u = min(u, i)
                d = max(d, i + 1)
                l = min(l, j)
                r = max(r, j + 1)
    if u == d:
        d += 1
    if l == r:
        r += 1
    for i in range(u, d):
        ans += "".join(list(map(str, gCopy[i][l:r]))) + "\n"
    print(ans)
solution()

            # for j in range(s, e):
            #     print(gCopy[i][j], end = "")
            # print()
# Test Case
# 3 10
# ..........
# ..XXX.XXX.
# XXX.......
#
# 답 : 
# .XX...X
# XX.....
#
# 4 4
# ....
# .XX.
# .XX.
# ....
# 
# 답 : 
# XX
# XX 

# 4 4
# ....
# .XX.
# .XX.
# ....

# 답 : XX
#      XX

# 4 4
# ....
# XX..
# XX..
# ....

# 답 : XX
#      XX

# 4 4
# ....
# ..XX
# ..XX
# ....

# 답 : XX
#      XX

# 4 4
# ..XX
# ..XX
# ....
# ....

# 답 : XX
#      XX

# 4 4
# XX..
# XX..
# ....
# ....

# 답 : XX
#      XX

# 4 4
# X..X
# XX..
# ....
# ....

# 답 : X


# 4 4
# X..X
# X.X.
# ....
# ....

# 답 :

# 4 3
# XX.
# X..
# .XX
# ..X

# 답 : 
# X..
# ...
# ..X

# 3 4
# XXXX
# ....
# XXXX

# 답 : 
# XX
# ..
# XX

# 7 1
# X
# X
# X
# .
# X
# .
# X
# 답 : X