# 개미
# 구현 아이디어 : 먼저 a1을 역으로 배치하고 a3에 a1 + a2 후 a3에서 원소를 하나씩 확인하면서
# a1에 j, j + 1번째 원소가 하나는 포함되있고 하나는 포함되지 않았을 때 바꾸고 방문 표시
# 방문 표시를 하는 이유는 1번 시행 시 한 번 바뀐 원소들은 또 한 번 바뀌면 안 되기 때문

import sys
input = sys.stdin.readline
n1, n2 = map(int, input().split())
a1 = list(map(str, input().strip()))[:: -1]
a2 = list(map(str, input().strip()))
n = int(input())
a3 = a1 + a2

def solution():
    for i in range(1, n + 1):
        visited = [1] * len(a3) # 스위칭한 원소들 체크용
        for j in range(len(a3) - 1):
            if visited[j]:
                if a3[j] in a1 and a3[j + 1] not in a1:
                    # tmp = a3[j]
                    # a3[j] = a3[j + 1]
                    # a3[j + 1] = tmp
                    a3[j], a3[j + 1] = a3[j + 1], a3[j] # 속도는 이게 더 느리다
                    visited[j] = 0
                    visited[j + 1] = 0
    print("".join(list(map(str, a3))))
solution()

# Test Case
# 3 4
# abc
# defg
# 1

# 답 : 
# cbdaefg

# 3 4
# abc
# defg
# 3

# 답 : 
# dcebfag

# 4 3
# abcd
# efg
# 1

# 답:
# dcbeafg

# 4 3
# abcd
# efg
# 4

# 답
# edfcgba

# 1 4
# a
# bcde
# 1

# 답 : 
# bacde

# 1 4
# a
# bcde
# 2

# 답 : 
# bcade

# 1 4
# a
# bcde
# 3

# 답 : 
# bcdae