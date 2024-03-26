// 순서쌍의 개수

import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    for i in 1..<Int(sqrt(Double(n)) + 1) {
        if n % i == 0 {
            if i * i == n {
                return answer * 2 + 1
            }
            
            answer += 1
        }
    }
    
    return answer * 2
}