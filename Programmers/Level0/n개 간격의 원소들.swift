// n개 간격의 원소들

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    return stride(from: 0, to: num_list.count, by: n).map { num_list[$0] }
}