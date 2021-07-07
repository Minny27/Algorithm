# -*- coding: utf-8 -*-

# 별자리 만들기
# 시간 : 1시간
# 구현 아이디어 : 크루스칼 알고리즘 -> 처음에는 가장 작은 거리들만 모으려고 했지만 이미 연결되 있는 노드가 또 연결될 수 있다는 것을 알았다..
# 1) 좌표를 저장하는 배열 p[x, y], 노드간 거리를 저장하는 배열 g[거리, 노드1, 노드2], root노드를 저장하는 배열 p[b] = a 를 각각 생성
# 2) dist함수, find함수, 생성, union함수에서는 부모가 같으면 0, 같지 않으면 1을 출력해서 합하는 경우를 체크
# 3) 최소 거리를 기준으로 정렬하고 최소 거리를 기준으로 노드가 연결 됐는지 확인
# 4) 연결이 되어있는 경우는 패스, 연결을 하는 경우에만 가중치를 ans에 더하기, 시행 횟수를 cnt에 더하기
# 5) cnt가 최소 연결 횟수 n - 1 이 됐을 때 ans를 출력 후 프로그램 종료
import sys, math
input = sys.stdin.readline
n = int(input())

def solution():
    def dist(x1, y1, x2, y2):
        return round(math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2), 2)

    def find(a):
        if a == p[a]:
            return a
        p[a] = find(p[a])
        return p[a]

    def union(a, b):
        a = find(a)
        b = find(b)
        if a == b:
            return False
        p[b] = a
        return True

    g = []
    p = list(range(n))
    point = []
    for _ in range(n):
        a, b =  map(float, input().split())
        point.append([a, b])
    for i in range(n - 1):
        for j in range(i + 1, n):
            x1, y1, x2, y2 = point[i][0], point[i][1], point[j][0], point[j][1]
            d = dist(x1, y1, x2, y2)
            g.append([d, i, j])
    g.sort()
    cnt = 0
    ans = 0
    for i in range(len(g)):
        w, a, b = g[i]
        if union(a, b):
            ans += w
            cnt += 1
            if cnt == n - 1:
                print(ans)
                break
solution()