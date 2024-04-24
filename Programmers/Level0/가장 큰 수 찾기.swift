// 가장 큰 수 찾기

import Foundation

func solution(_ array:[Int]) -> [Int] {
    var (index, maxValue) = (0, 0)
    for (i, v) in array.enumerated() {
        if maxValue < v {
            (index, maxValue) = (i, v)
        }
    }
    
    return [maxValue, index]
}

// 다른 사람 풀이
// func solution(_ array:[Int]) -> [Int] {
//     let max = array.enumerated().max(by: { $0.element < $1.element })!
//     return [max.element, max.offset]
// }