// 삼각형의 완성조건 (1)

import Foundation

func solution(_ sides:[Int]) -> Int {
    guard let maxValue = sides.max() else { return 2 }
    return maxValue * 2 - sides.reduce(0, +) < 0 ? 1 : 2
}