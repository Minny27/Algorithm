// 조건에 맞게 수열 변환하기 1

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    return arr.map { $0 >= 50 && $0 % 2 == 0 ? $0 / 2 : $0 < 50 && $0 % 2 == 1 ? $0 * 2 : $0 }
}