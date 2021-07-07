# 상자넣기
# 구현 아이디어 : LIS 구하기

num = int(input())
box = [int(_) for _ in input().split()] # box의 크기 배열
dp = [1] * num
for i in range(num):
    for j in range(i):
        if box[i] > box[j]:
            dp[i] = max(dp[i], dp[j] + 1)
print(max(dp))