// 요격 시스템
// 문제 유형: 정렬
// 느낀점: O(n^2)으로 해결할 수 없는 문제는 O(nlogn) 또는 O(n)으로 해결할 수 있는 알고리즘을 생각할 것!

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted(by: { $0[1] < $1[1] })
    var e = 0
    var answer = 0
    
    for target in targets {
        if target[0] < e { continue }
        e = target[1]
        answer += 1
    }
    
    return answer
}