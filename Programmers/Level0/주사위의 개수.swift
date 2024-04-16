// 주사위의 개수

import Foundation

func solution(_ box:[Int], _ n:Int) -> Int {
    return (box[0] / n) * (box[1] / n) * (box[2] / n)
}