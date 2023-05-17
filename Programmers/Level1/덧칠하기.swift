// 덧칠하기
// 문제 유형: 구현
// 느낀점: 더 잘하자?!

import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var start = section[0]
    var answer = 1
    
    for i in 1..<section.count {
        if start + m - 1 >= section[i] { continue }
        start = section[i]
        answer += 1
    }
    
    return answer
}