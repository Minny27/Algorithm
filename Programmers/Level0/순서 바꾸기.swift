// 순서 바꾸기

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    return Array(num_list[n..<num_list.count] + num_list[0..<n])
}

