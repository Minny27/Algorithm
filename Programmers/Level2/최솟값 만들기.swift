// 최솟값 만들기
// 문제 유형: 구현

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0

    for v in zip(A.sorted(by:<), B.sorted(by:>)) {
        let (min, max) = v
        ans += min * max
    }

    return ans
}