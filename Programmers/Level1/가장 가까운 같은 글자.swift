// 가장 가까운 같은 글자
// 문제 유형: 딕셔너리 + 문자열
// 느낀점: dict에 특정 문자열의 이전 인덱스를 저장하는 것이 더 효율적

import Foundation

func solution(_ s:String) -> [Int] {
    var answer = [Int]()
    var dict = [Character: Int]()
    
    for (i, char) in s.enumerated() {
        if dict[char] == nil {
            answer.append(-1)
        } else {
            answer.append(i - dict[char]!)
        }
        
        dict[char] = i
    }
    
    return answer
}