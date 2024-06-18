// 마지막 두 원소

import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    return num_list[num_list.count - 2] < num_list[num_list.count - 1] ? num_list + [num_list[num_list.count - 1] - num_list[num_list.count - 2]] : num_list + [num_list[num_list.count - 1] * 2]
}