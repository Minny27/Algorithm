// 제곱수 판별하기

import Foundation

func solution(_ n:Int) -> Int {
    return Int(sqrt(Double(n)) * 10) % 10 == 0 ? 1 : 2
}