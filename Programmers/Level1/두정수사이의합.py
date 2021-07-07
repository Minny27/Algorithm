def solution(a, b):
    answer = 0

    if a>b:
        tmp = a
        a = b
        b = tmp
    
    for i in range(a,b+1):
        answer = answer + i

    return answer

print(solution(3,5))
print(solution(3,3))
print(solution(5,3))
    