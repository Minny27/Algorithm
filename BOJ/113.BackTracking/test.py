
from itertools import permutations
a = sorted([5,4,3])
print(a)
arr = permutations(a, 2)
for i in arr:
    for j in i:
        print(j, end = " ")
    print()