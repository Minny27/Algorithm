// 두 원 사이의 정수 쌍
// 문제 유형: 기하학
// 느낀점: 처음부터 피타고라스 정리를 생각하지 못해서 아이디어를 참고했음... 2단계가 이렇게 어려워졌었나 싶었음

import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var answer = 0
    
    for i in 1...r2 {    
        var minY = 0
        if i <= r1 {
            minY = Int(ceil(sqrt(pow(Double(r1), 2) - pow(Double(i), 2))))
        }
        let maxY = Int(floor(sqrt(pow(Double(r2), 2) - pow(Double(i), 2))))
        
        answer += maxY - minY + 1
    }
    
    return Int64(answer * 4)
}