# 블랙잭
# 구현 아이디어 : DFS로 depth를 하나씩 늘려가면서 depth가 2일때, for 문으로 해당 idx에서 n까지를 확인
# 확인할 때 세 수의 합과 m의 차이가 가장 적을 때의 sum + c[i]를 minValue에 저장
# 그리고 같은 뎁스에서의 이동은 리커전을 하나 더 이용해서 depth는 같고 이전 c[i]를 더하지 않은 sum을 대입하는 방식
#                   5
#   6       7       8       9
#7  8  9   8  9      9       

# dfs를 짤 때는 트리 형식을 그림으로 그리고 리커전 함수에 들어갔을 때의 상황을 정확하게 인지할 수 있어야함
# 삼중 for문 안쓸라고 recursion썼는데 삼중 for문이 시간이 더 빠르네..?
# recursion의 시간복잡도를 계산할줄 알아야겠다..

import sys
input = sys.stdin.readline
n, m = map(int, input().split())
c = list(map(int, input().split())) # Card
minValue = [300000] # m과 가장 가까운 수

def dfs(idx, depth, sum):
    if idx >= n:
        return
    if depth == 2:
        for i in range(idx, n):
            tmp = sum + c[i]
            if m >= tmp and abs(m - minValue[0]) > abs(m - tmp):
                minValue[0] = tmp
        return minValue
    else:
        dfs(idx + 1, depth + 1, sum + c[idx])
        dfs(idx + 1, depth, sum)  

for i in range(0, n - 1):
    dfs(i, 0, 0)
print(minValue[0])