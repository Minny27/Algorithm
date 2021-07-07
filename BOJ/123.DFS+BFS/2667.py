# 단지번호붙이기
# 구현 아이디어 : dfs방식으로 1을 기준으로 r 또는 l 또는 d 또는 u 확인하기
# 해당 번지수에서의 1의 개수를 파악 후 모든 번지 수의 합을 마지막에 출력

# map = [input() for _ in range(n)]
# map = [int(input()) for _ in range(n)] 스트링은 immutable 변경 불가 변수

n = int(input())
map = [list(map(int, input())) for _ in range(n)]
dy = [1, -1, 0, 0] # 행
dx = [0, 0, 1, -1] # 열
dp = [] # 모든 단지의 개수 모음
cnt = [0] # 한 단지의 합

def dfs(y, x):
   # 재귀 호출 시 해당 원소기준 r 또는 l 또는 d 또는 u가 0일 때
   if map[y][x] == 0:
      return
   map[y][x] = 0
   # 해당 원소 기준 r 또는 l 또는 d 또는 u을 확인 
   for i in range(4):
      dy1 = y + dy[i]
      dx1 = x + dx[i]
      if dx1 == -1 or dy1 == -1 or dx1 >= n or dy1 >= n:
         continue
      if map[dy1][dx1] == 1:
         cnt[0] += 1
         dfs(dy1, dx1)
   return cnt[0] 
   
for i in range(n):
   for j in range(n):
      if map[i][j] == 1:
         cnt[0] = 1
         dp.append(dfs(i, j))
dp.sort()
print(len(dp))
for i in range(len(dp)):
   print(dp[i])

   # Test Case
# 7
# 0110100
# 0110101
# 1110101
# 0000111
# 0100000
# 0111110
# 0111000

# 7
# 1010011
# 1010101
# 1110101
# 0000111
# 0100000
# 0111110
# 0111000

# 7
# 0000000
# 0000000
# 0000000
# 0000000
# 0000000
# 0000000
# 0000000

# 7
# 1111111
# 1111111
# 1111111
# 1111111
# 1111111
# 1111111
# 1111111