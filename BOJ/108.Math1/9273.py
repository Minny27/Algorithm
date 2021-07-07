# 정제헌을 팔자!
# 구현 아이디어 : n ** 2의 n까지의 약수의 개수를 구하기
# 입력이 while문으로 끝나지 않을 때는 try except 구문으로 끝내기

# import sys
# input = sys.stdin.readline

def solution():
    while 1:
        data = ""
        try:
            data = input()
        except EOFError:
            exit(0)
        arr = list(map(int, data.split('/')))
        n = arr[1]
        cnt = 1
        for i in range(n + 1, n * 2):
            cnt += (i * n) % (i - n) == 0
        print(cnt)
solution()

# def solution():
#     while True:
#         data = ""
#         try:
#             data = input()
#         except EOFError:
#             exit(0)
#         cal_num = int(data[2:])
#         answer = 0
#         for i in range(cal_num + 1, 2 * cal_num + 1):
#             answer = answer + 1 if i * cal_num % (i - cal_num) == 0 else answer
#         print(answer)
# solution()

# 해당 알고리즘 이해
# 1 -> 1
# 2 -> 4 4
# 3 -> 6 6 / 12 4
# 4 -> 8 8 / 12 6
# 5 -> 10 10
# 6 -> 12 12 / 24 8
# 7 -> 14 14
# 8 -> 16 16 / 24 12

# 3 -> 4
# 4 -> 6
# 6 -> 8
# 8 -> 12
# => (i * n) % (i - n) 로 해를 구할 수 있다.