// 홀수 vs 짝수

import Foundation

func solution(_ num_list:[Int]) -> Int {
    let odd = stride(from: 0, to: num_list.count, by: 2).map { num_list[$0] }.reduce(0, +)
    let even = stride(from: 1, to: num_list.count, by: 2).map { num_list[$0] }.reduce(0, +)
    return max(odd, even)
}