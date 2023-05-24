// 문자열나누기
// 문제 유형: 문자열
// 느낀점: iterator를 할 때, 해당 인덱스에서 처리를 바로 할 것인지를
// 명확하게 먼저 생각할 것!
// 그리고 기본적인 반례는 생각하고 시작할 것
// 이전 값과 현재 값 그리고 이전까지의 다른 알파벳의 수, 첫 알파벳의 수를
// 일일이 변수로 나누어서 처리하려다보니 좀 더 복잡해졌음. 더 잘해보자

import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var now: Character? = nil
    var count = 0
    
    for char in s {
        if now == nil {
            now = char
            count = 1
            answer += 1
            continue
        }
        
        count += now == char ? 1 : -1
        
        if count == 0 {
            now = nil
        }
    }
    
    return answer
}