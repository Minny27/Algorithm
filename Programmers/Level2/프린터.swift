// 프린터
// 시간: 20분

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var ans = 0
    var prior = priorities // let -> var
    var now = location // 요청한 문서의 현재 위치
    while now >= 0 {
        var maxValue = 0
        for i in 0..<prior.count {
            maxValue = maxValue < prior[i] ? prior[i] : maxValue
        }   
        // 대기열의 첫 번째 인쇄물의 우선순위가 가장 높을 때
        if prior[0] >= maxValue {
            prior.removeFirst()
            ans += 1
            now -= 1
        }
        // 그렇지 않을 때
        else {
            now =  now == 0 ? prior.count - 1 : now - 1
            prior.append(prior.removeFirst())
        }
    }
    return ans
}