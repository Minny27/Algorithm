# 방 번호
import math

str = [s for s in input().replace('9', '6')]
room = [0] * 10

for i in range(len(str)):
    room[int(str[i])] += 1
room[6] = math.ceil(room[6] / 2)
print(max(room))