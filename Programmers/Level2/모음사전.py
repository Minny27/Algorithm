# 모음 사전
# 사간 : 15분

import sys
from itertools import product

def solution(word):
    ans = 0
    arr = ["A", "E", "I", "O", "U"]
    wordArr = list()
    for i in range(1, 6):
        for wordTmp in product(arr, repeat = i):
            wordArr.append("".join(wordTmp))
    wordArr.sort()

    for i in range(len(wordArr)):
        if wordArr[i] == word:
            ans = i + 1
            break
    return ans

print(solution("AAAAE"))