// 이진 변환 반복하기
// 문제 유형: 수학
// 느낀점: 문제를 더 빠르게 이해할 수 있게 훈련을 많이 해야할듯.

import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var count = 0
    var zero = 0
    
    while s != "1" {
        let ss = s.filter { 
            if $0 == "0" { zero += 1 }
            return $0 == "1"
        }
        s = String(ss.count, radix: 2)
        count += 1
    }
    
    return [count, zero]
}