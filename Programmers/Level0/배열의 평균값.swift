// 배열의 평균값

import Foundation

func solution(_ numbers:[Int]) -> Double {
    return Double(numbers.reduce(0, +)) / Double(numbers.count)
}