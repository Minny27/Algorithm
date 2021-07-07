# 트리의 높이와 너비
# 시간 : 4시간
# 구현 아이디어: 중위 순회, root노드를 찾기 위해서 root노드에만 -1

class Node:
    def __init__(self, root, left, right):
        self.root = root
        self.left = left
        self.right = right

import sys
input = sys.stdin.readline
n = int(input())
dMin = [n + 1] * (n + 1) # depth min -> 해당 층에서의 가장 왼쪽에 있는 값
dMax = [0] * (n + 1) #depth max -> 해당 층에서의 가장 오른쪽에 있는 값
tree = [Node(-1, -1,- 1) for _ in range(n + 1)]
rIdx = 0 # root index
col = 1 # column -> 해당 노드의 열의 위치
ans = [0] * 2

def inorder(root, depth):
    global col
    if tree[root].left != -1:
        inorder(tree[root].left, depth + 1)
    dMin[depth] = min(dMin[depth], col)
    dMax[depth] = max(dMin[depth], col)
    col += 1
    if tree[root].right != -1:
        inorder(tree[root].right, depth + 1)

for _ in range(n):
    root, l, r = map(int, input().split())
    tree[root].left = l
    tree[root].right = r
    # root노드를 찾기 위해서 자식노드에는 부모노드를 입력
    if l != -1:
        tree[l].root = root
    if r != -1:
        tree[r].root = root
# 루트 노드 찾기
for i in range(1, n + 1):
    if tree[i].root == -1:
        rIdx = i
        break
inorder(rIdx, 1)
for i in range(n, 0, -1):
    tmp = dMax[i] - dMin[i] + 1
    if ans[1] <= tmp:
        ans[1] = tmp
        ans[0] = i
print(ans[0], ans[1])