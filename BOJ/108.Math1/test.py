# import sys
# s = "helloWorld"
# sys.stdout.write(s)

# import sys
# input = sys.stdin.readline
# print(tuple(map(int, input().split())))
# import sys
# input = sys.stdin.readline
# n = int(input())
# arr = [list(map(int, list(map(int, input().strip())))) for _ in range(n)]
# print(arr)
import sys
input = sys.stdin.readline
arr = [1,2,3]
for i in arr[::-1]:
    print(i)