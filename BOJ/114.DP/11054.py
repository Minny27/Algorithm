# 가장 긴 바이토닉 부분 수열

num = int(input())
s = [int(_) for _ in input().split()] # 수
dp1 = [1 for _ in range(1001)] # 정방향 LIS
dp2 = [1 for _ in range(1001)] # 역방향 LIS
ans = 0

# 정방향에서 수열의 수를 하나씩 확인하면서 그 이전까지의 수 중에서 그 수보다 작으면
# dp에 저장돼있는 값과 해당 인덱스의 dp값 + 1과 비교해서 큰 값을 dp에 저장
for i in range(len(s)):
    for j in range(i):
        if s[i] > s[j]:
            dp1[i] = max(dp1[i], dp1[j] + 1)

for i in range(len(s) - 1, 0, -1):
    for j in range(len(s) - 1, i, -1):
        if s[i] > s[j]:
            dp2[i] = max(dp2[i], dp2[j] + 1)

ans = dp1[0] + dp2[0]
for i in range(len(s)):
    ans = max(ans, dp1[i + 1] + dp2[i + 1])
print(ans - 1)