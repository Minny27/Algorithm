# 집합의 표현
# 시간 : 2시간
# 구현 아이디어 : 숫자 하나하나를 노드로 생각하고 n1의 리프노드에 n2를 추가하는 방식
# 확인할 때는 n1, n2의 리프노드가 같은지를 비교하고 같으면 yes, 아니면 no

import sys
sys.setrecursionlimit(10 ** 6)
input = sys.stdin.readline
n, m = map(int, input().split())
arr = list(range(n + 1))
# arr = [i for i in range(n + 1)]

def find(n1):
    if n1 == arr[n1]:
        return n1
    arr[n1] = find(arr[n1])
    return arr[n1]

def union(n1, n2):
    n1 = find(n1)
    n2 = find(n2)
    if n1 == n2:
        return
    n1, n2 = min(n1, n2), max(n1, n2) # 이 라인을 추가하니까 시간이 좀 줄었는데 이유는 모르겠습니다..
    arr[n1] = n2
    
def solution():
    ans = []
    for _ in range(m):
        w, n1, n2 = map(int, input().split())
        if w == 0:
            union(n1, n2)
        else:
            n1, n2 = find(n1), find(n2)
            if n1 != n2:
                ans.append("NO")
            else:
                ans.append("YES")
    print("\n".join(list(ans)))
solution()