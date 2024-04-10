// 중앙값 구하기

import Foundation

func solution(_ array:[Int]) -> Int {
    return array.sorted(by: <)[array.count / 2]
}