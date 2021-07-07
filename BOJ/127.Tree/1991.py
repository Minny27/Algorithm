# -*- coding: utf-8 -*-

# 트리 순회
# 시간 : 1시간
# 구현 아이디어 : 이진 트리
# 1) class로 먼저 초기화 할 노드의 표본을 만들기
# 2) 인덱스가 str이므로 tree를 해시 형태로 생성
# 3) 재귀를 통해서 구현
# 트리 기준
# preorder -> root -> 왼 -> 오
# inorder -> 왼 -> root -> 오
# postorder 왼 -> 오 -> root
class Node:
    def __init__(self, node, left, right):
        self.node = node
        self.left = left
        self.right = right

import sys
input = sys.stdin.readline
n = int(input())
tree = {} # str을 인덱스로 쓰기 위해서 해시로 tree 생성
for i in range(n):
    n, l, r = input().strip().split()
    tree[n] = Node(n, l, r)
def preorder(node):
    print(node.node, end = "")
    if node.left != '.':
        preorder(tree[node.left])
    if node.right != '.':
        preorder(tree[node.right])
def inorder(node):
    if node.left != '.':
        inorder(tree[node.left])
    print(node.node, end = "")
    if node.right != '.':
        inorder(tree[node.right])
def postorder(node):
    if node.left != '.':
        postorder(tree[node.left])
    if node.right != '.':
        postorder(tree[node.right])
    print(node.node, end = "")

preorder(tree['A'])
print()
inorder(tree['A'])
print()
postorder(tree['A'])
print()