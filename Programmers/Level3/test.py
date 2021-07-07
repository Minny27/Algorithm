

v = []
def a(arr):
    # global v
    v = arr
    b()
def b():
    v.append(7)
    c()
def c():
    v.append(8)
    print(v)
a([4, 5, 6])