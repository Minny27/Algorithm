// 최소직사각형
// 문제 유형: 구현

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var answer = [0,0]
    for size in sizes {
        answer[0] = max(answer[0], size.max() ?? 0)
        answer[1] = max(answer[1], size.min() ?? 0)
    }
    return answer[0] * answer[1]
}