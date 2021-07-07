# 단어 수학
# 시간 : 7시간
# 구현 아이디어 : ABC = 100A + 10B + C

import sys
input = sys.stdin.readline
n = int(input())
word = [0] * 26
for i in range(n):
    line = list(map(str, input().strip()))
    l = len(line) - 1
    for j in range(len(line)):
        word[ord(line[j]) - 65] += 10 ** l
        l -= 1
word.sort(reverse = 1)

def solution():
    ans = 0
    maxValue = 9
    for i in word:
        if i == 0:
            break
        else:
            ans += maxValue * i
            maxValue -= 1
    print(ans)
solution()

# Test Case

# 2
# BC
# AA

# 답 : 186

# 2
# ADCA
# BCBD

# 답 : 18474

# 2
# BDAA
# AEA

# 답 : 10644

# 6
# ABABABAB
# BABABABA
# ABABABAB
# BABABABA
# CCCCCCCA
# CCCCCCBA

# 답 : 533333350

# def solution():
#     ans = 0
#     ht1 = dict().fromkeys(value)
#     ht2 = dict().fromkeys(value)
#     s = set()
#     for i in ht1.keys():
#         ht1[i] = -1
#         ht2[i] = 0
#     l = len(word[0])
#     max = 9
#     for i in range(len(word[0])):
#         for j in range(n):
#             if len(word[j]) >= l:
#                 ht2[word[j][i]] += 1
#         l -= 1
#         tmp2 = sorted(ht2.items(), key = lambda k : k[1], reverse = 1) # ht2 의 값을 기준 내림차순 정렬
#         tmp1 = sorted(ht1.items(), key = lambda k : k[1], reverse = 1) # ht1 의 값을 기준 내림차순 정렬
#         for q in range(len(tmp2)):
#             if tmp2[q][1] == 0:
#                 break
#             if ht1[tmp2[q][0]] == -1:
#                 ht1[tmp2[q][0]] = max
#                 max -= 1
#         for q in range(len(tmp2)):
#             if tmp1[q][1] == -1:
#                 break
#             if tmp1[q][0] not in s and tmp1[q][0] != tmp2[q][0]:
#                 ht1[tmp1[q][0]] = tmp2[q][1]
#                 s.add(tmp1[q][0])
#     print(ht1)
#     for i in range(len(word)):
#         tmp = ""
#         for j in range(len(word[i])):
#             tmp += str(ht1[word[i][j]])
#         ans += int(tmp)
#     return ans
# print(solution())

# def solution():
#     l = len(word[0])
#     ans = [''] * len(word)
#     k = 9
#     for i in range(len(word[0])):
#         if ht1.get(word[0][i]) == None:
#             ht1[word[0][i]] = str(k)
#             ans[0] += str(k)
#             k -= 1
#         else:
#             ans[0] += ht1.get(word[0][i])

#         for j in range(1, len(word)):
#             if len(word[j]) >= l and ht1.get(word[j][i - (len(word[0]) - len(word[j]))]) == None:
#                 ht1[word[j][i - (len(word[0]) - len(word[j]))]] = str(k)
#                 ans[j] += str(k)
#                 k -= 1
#             elif len(word[j]) >= l and ht1.get(word[j][i - (len(word[0]) - len(word[j]))]) != None:
#                 ans[j] += ht1.get(word[j][i - (len(word[0]) - len(word[j]))])
#             else:
#                 break
#         l -= 1
#     sum = 0
#     for i in range(len(ans)):
#         sum += int(ans[i])
#     return sum
# print(solution())

# Test Case

# 2
# BC
# AA

# 답 : 186

# 2
# ADCA
# BCBD

# 답 : 18474

# 2
# BDAA
# AEA

# 답 : 10644

# 6
# ABABABAB
# BABABABA
# ABABABAB
# BABABABA
# CCCCCCCA
# CCCCCCBA

# 답 : 533333350