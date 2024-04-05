// 짝수 홀수 개수

import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    let oddCount = num_list.filter { $0 % 2 == 1 }.count
    return [num_list.count - oddCount, oddCount]
}