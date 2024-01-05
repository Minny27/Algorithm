// 올바른 괄호
// 문제 유형: 구현
// 느낀점: Stack을 쓰라는 문제였는데 Stack을 쓰니 시간 초과가 발생했다..

import Foundation

func solution(_ s:String) -> Bool {
    var ans: Bool = false
    var count = 0
    
    for ss in s {
        if ss == "(" {
            count += 1
        } else {
            if count > 0 {
                count -= 1
            } else { return false }
        }
    }

    return count == 0 ? true : false
}