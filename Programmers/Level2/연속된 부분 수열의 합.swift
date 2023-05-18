// 연속된 부분 수열의 합
// 문제 유형: 투포인터
// 느낀점: 투포인터의 풀이 방법을 좀 확실하게 정립해 놓아야 할 것 같은 생각이 들었음.
// 그 이유는 먼저 계산을 하고 포인터를 옮길 지, 옮긴 다음에 계산을 할 지 왔다갔다 했음...

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var s = -1
    var e = -1
    var count = Int.max
    var currentCount = 0
    var answer = [0, 0]
    var sum = 0
    
    while s < sequence.count && e < sequence.count {
        if sum <= k {
            if sum == k {
                if count > currentCount {
                    count = currentCount
                    (answer[0], answer[1]) = (s + 1, e)
                }
            }
            e += 1
            if e >= sequence.count { break }
            currentCount += 1
            sum += sequence[e]
        } else {
            s += 1
            if s >= sequence.count { break }
            currentCount -= 1
            sum -= sequence[s]
        }
    }
    
    return answer
}
