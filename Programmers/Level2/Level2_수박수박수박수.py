def solution(n):
    if n % 2 == 1:
        answer = ((n // 2) * '수박') + '수'
    
    else:
        answer = (n // 2) * '수박'
    return answer

print(solution(1))