# 빠른 A + B
# 속도 차이
# " ".join > s += str(5) > 값을 배열에 넣고 출력

import sys

n = int(sys.stdin.readline().strip())
# ans = []
s = ""
for i in range(n):
    a, b = sys.stdin.readline().split()
    # ans.append(int(a) + int(b))
    s += str(int(a) + int(b)) + "\n"
print(s)
# print("\n".join(list(map(str, ans))))
# for i in range(n):
#     print(ans[i])
# sys.stdout.write("\n".join(list(map(str, ans))))

# 시간 초과
# n = int(input())
# ans = [0] * n
# for i in range(n):
#     n, m = list(map(int, input().split()))
#     ans[i] = n + m
# print("\n".join(list(map(str, ans))))