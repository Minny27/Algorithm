// 피자 나눠 먹기(3)

import Foundation

func solution(_ slice:Int, _ n:Int) -> Int {
    return Int(ceil(Double(n) / Double(slice)))
}