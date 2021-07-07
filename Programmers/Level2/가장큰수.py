# -*- coding: utf-8 -*-

# 가장 큰 수
def solution(numbers):
    arr = []
    for i in numbers:
        s = str(i)
        arr.append([s, len(s)])
    arr1 = sorted(arr, key = lambda k : (k[0], k[1]))
    answer = ''.join(map(str, arr1))
    return answer
a = ["1000", "9", "88", "10","999", "666", "2", "989", "97"]
# a = [1000, 10]
print(solution(a))