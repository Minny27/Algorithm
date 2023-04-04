// 백준 13305 - 주유소
// 문제 유형: 그리디
// 느낀점: 다시 풀어봤는데 아직 많이 부족하다고 느낌.. 풀이 아이디어를 아직 빠르게 찾지 못하고 있음.

import Foundation

var n = Int(readLine() ?? "") ?? 0
let legs = (readLine() ?? "").components(separatedBy: " ").map { Int($0) ?? 0 }
let prices = (readLine() ?? "").components(separatedBy: " ").map { Int($0) ?? 0 }

func solution() -> Int {
    var answer = 0
    var minValue = prices[0]
    
    // 반복하면서 현 지점에서 다음 지점까지의 최소값을 answer에 갱신하고
    // 주유값은 가장 작은 주유값으로 갱신
    for i in 0..<n-1 {
        answer += legs[i] * minValue
        minValue = min(minValue, prices[i+1])
    }
    
    return answer
}

print(solution())
