// 배열 만들기 1

import Foundation

func solution(_ n:Int, _ k:Int) -> [Int] {
    return stride(from: k, through: n, by: k).map { $0 }
}