# 팩토리얼 0의 개수
# 구현 아이디어 : 팩토리얼 값을 먼저 구하고 슬라이싱을 위해서 str로 변환 후
# 마지막 인덱스부터 0을 확인하면서 ans의 값을 늘린다.

import math

f = str(math.factorial(int(input())))
ans = 0 # 끝에서 부터의 0의 개수

# 숫자 끝에서 부터 0을 세고 다른 숫자이면 break
for i in range(len(f), 0, -1):
    if f[i - 1 : i] == '0':
        ans += 1
    else: 
        break
print(ans)