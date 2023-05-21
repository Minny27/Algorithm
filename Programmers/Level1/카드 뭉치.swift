// 카드 뭉치
// 문제 유형: 구현
// 느낀점: 쉬운 풀이가 있을 수 있는데... 문제를 더 많이 풀어보자

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1 = cards1.reversed().map { String($0) }
    var cards2 = cards2.reversed().map { String($0) }
    
    for g in goal {
        if !cards1.isEmpty && g == cards1.last {
            cards1.removeLast()
            continue
        }
        
        if !cards2.isEmpty && g == cards2.last {
            cards2.removeLast()
            continue
        }
        return "No"
    }
    
    return "Yes"
}