// 크기가 작은 부분 문자열
// 문제 유형: 문자열
// 느낀점: Array() 생성자를 쓰지 않아도 string.map { String($0) }
// 을 이용하면 문자열을 문자열 Array로 만들 수 있다는 것을 알았음...

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var answer = 0
    var n = p.count
    let t = Array(t).map { String($0) }
    let p = Int(p) ?? 0
    
    for i in 0..<t.count - n + 1 {
        let value = Int(t[i..<i + n].joined()) ?? 0
        answer += value <= p ? 1 : 0
    }
    
    return answer
}