# -*- coding: utf-8 -*-

# 과제
# 구현 아이디어 : 그리디(가장 점수가 큰 과제의 마감일 째에 과제를 수행)
# 처음에는 어떤 과제를 처음으로 시작을 해야할까로 생각을 해서 dp, 혹은 브루트 포스로 생각을 했다가 시간복잡도가 1000! * n 이렇게 나와서 안 된다고 판단
# 1) score를 기준으로 내림차순 정렬 
# 2) score가 큰 값을 기준으로 day 위치를 내리면서 해당 일 째에 값이 있으면 패스, 아니면 ans에 그 값을 대입
import sys
n = int(input())
ans = [0] * (1001)
task = []
for i in range(n):
    day, score = map(int, input().split())
    task.append([score, day])
task.sort(reverse = 1)
for i in range(n):
    score, day = task[i]
    for j in range(day, 0, -1):
        if ans[j] == 0:
            ans[j] = score
            break
print(sum(ans))
    