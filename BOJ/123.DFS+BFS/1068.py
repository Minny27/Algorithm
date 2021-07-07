# 트리
# 아이디어 : 노드를 지우는 함수 생성, bfs방식으로 지울 노드와 연결된 노드는 모두 -2
# for문으로 -2가 아니고 해당 인덱스가 한 번도 나오지 않으면 cnt += 1

num = int(input())
parent = [int(_) for _ in input().split()] # 연결된 부모 노드
r = int(input()) # 지울 노드
cnt = 0 # 답

# bfs로 지울 노드를 모두 -2로 수정
def remove(n):
    parent[n] = -2
    queue = [n]
    while len(queue) > 0:
        for i in range(num):
            if parent[i] == queue[0]:
                parent[i] = -2
                queue.append(i)
        queue.pop(0)
remove(r)

# -2가 아니면서 리프 노드이면 + 1
for i in range(num):
    if parent[i] != -2 and i not in parent:
        cnt += 1
print(cnt)

# Test Case
# 6
# -2 -2 -1 -1 -1 4