# 크레인 인형뽑기

# 인형을 담을 5개의 스택과 뽑은 인형 스택 1개로 구현하기
class stack():
    def __init__(self):
        self.stack = []

        def push(self, item):
            self.items.append(item)

        def pop(self):
            return self.items.pop()

        def isEmpty(self):
            return not self.items

def solution(board, moves):
    answer = 0
    d_stk = stack()
    j = 0

    for k in moves:
        while board[j,k-1] != 0:
            d_stk.push(board[[j,k-1]])
            break

    if            
 
    return answer


# print(solution([[0,0,0,0,0],
#                 [0,0,1,0,3],
#                 [0,2,5,0,1],
#                 [4,2,4,4,2],
#                 [3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
