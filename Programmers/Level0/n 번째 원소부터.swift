// n번째 원소부터

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    return Array(num_list[n-1..<num_list.count])
}