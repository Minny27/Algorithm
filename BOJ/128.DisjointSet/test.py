from collections import defaultdict
a = defaultdict(str)
a['s'] = 's'
b = defaultdict(lambda : 1)
b['s'] += 1
print(a)
print(b)