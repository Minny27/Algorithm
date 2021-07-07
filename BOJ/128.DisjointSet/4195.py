# -*- coding: utf-8 -*-

# 친구 네트워크
# 시간 : 1시간 반
# 구현 아이디어 : 최소 스패닝 트리가 아닌 애들끼리만 합을 더해주기
# 딕트 자료구조를 잘 활용할 것!! 그리고 리턴 값이 없는 리컬시브 함수는 None을 출력할 수 있는 것을 주의할 것!
import sys
from collections import defaultdict
input = sys.stdin.readline
t = int(input())
ans = []

def find(a):
    if a == ht[a]:
        return a
    ht[a] = find(ht[a])
    return ht[a]

def union(a, b):
    a = find(a)
    b = find(b)
    if a != b:
        ht[b] = a
        fCnt[a] += fCnt[b] # root노드가 같지 않은 친구일 때만 첫 번째 친구에 값을 갱신

for i in range(t):
    n = int(input())
    # ht = defaultdict(str) # string 형태의 해시 테이블 생성
    ht = dict()
    fCnt = defaultdict(lambda : 1) # 해시 키 값이 생성 되면 자동으로 1을 초기화 시키기
    for j in range(n):
        f1, f2 = input().strip().split()
        if f1 not in ht:
            ht[f1] = f1 # 처음에는 자기 자신으로 초기화
        if f2 not in ht:
            ht[f2] = f2
        union(f1, f2)
        ans.append(fCnt[find(f1)])
print("\n".join(map(str, ans)))
