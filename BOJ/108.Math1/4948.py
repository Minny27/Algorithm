# 베르트랑 공준
# 구현 아이디어 : 먼저 에라토스테네스의 체 방식으로 소수를 구하는데
# 슬라이싱을 통해서 구현 visited 배열에 소수인 친구들만 1 나머지 0
# 그래서 visited 배열에서 n[i] + 1 에서 n[i] * 2 까지의 인덱스에서 값이 1이면 cnt를 증가
# string 변수에 cnt값을 저장 후 출력
# 입력 값을 받을 때마다 함수에 넣어서 출력했으면 O(n)으로 시간을 줄일 수 있었을 것...

# import sys

# input = sys.stdin.read().split("\n")
# pn = []
n = []
visited = [0, 0, 1] + [1, 0] * 123456
i = 0
while 1:
    n.append(int(input()))
    if n[i] == 0:
        n.remove(0)
        break
    i += 1

def primeNum():
    for i in range(3, 497, 2):
        if visited[i]:
            visited[i * 2 :: i] = [0] * len(visited[i * 2 :: i])

def solution():
    s = ""
    for i in range(len(n)):
        cnt = 0
        for j in range(n[i] + 1, n[i] * 2 + 1):
            if visited[j]:
                cnt += 1
        s += str(cnt) + "\n"
        i += 1
    print(s)
primeNum()
solution()