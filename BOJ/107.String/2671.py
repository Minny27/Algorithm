# 잠수함 식별

import sys, re
input = sys.stdin.readlines()
s = input[0].strip()
p = re.compile("(100+1+|01)+")
m = p.fullmatch(s)
if m:
    print("SUBMARINE")
else:
    print("NOISE")

# 100000000001101