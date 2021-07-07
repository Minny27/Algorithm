import sys
input = sys.stdin.readline
t = int(input())

def solution():
	ans = [0] * t
	for i in range(t):
		n, m = map(int, input().split())
		cnt = 0
		if n < 5:
			ans[i] = 0
			continue
		availn = n // 5
		availm = m // 7
		tmp = 0
		if availn >= availm:
			n -= availm * 5
			m -= availm * 7
			cnt += availm + (n + m) // 12
		else:
			n -= availn * 5
			n -= availn * 7
			cnt += availn
		# if n >= 5 and n + m >= 12:
		# 	cnt += 1
		ans[i] = cnt
	print("\n".join(map(str, ans)))
solution()