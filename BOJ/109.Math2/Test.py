print(2 * 3 ** 2)

v = 1
w = 1
# while 1:
#     if v == w == 1:
#         print("yes!")
#         break

# print(str(v) + " " + str(w))

# math.sqrt(v)

# a = [1, 2, 3]
# b = [1] +  [2] + [3]
# print(a)
# print(b)

print(int(5 ** 0.5) + 1)

from bisect import bisect_left as bl
from bisect import bisect_right as br
a = [2,3,5,7,11]
b = a[bl(a, 3): br(a, 11)]
print(b)