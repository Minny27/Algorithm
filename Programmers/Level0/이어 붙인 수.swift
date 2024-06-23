// 이어 붙인 수

import Foundation

func solution(_ num_list:[Int]) -> Int {
    return Int(num_list.filter { $0 % 2 == 0 }.map { String($0) }.joined())! + Int(num_list.filter { $0 % 2 != 0 }.map { String($0) }.joined())!
}
