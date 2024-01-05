// JadenCase 문자열 만들기
// 문제 유형: 문자열
// 느낀점: 처음에는 문자열 사이에 공백 하나만 있다고 생각해서 공백을 기준으로 split해서 풀 수 있다고 생각했음.
// 문제를 꼼꼼히 읽어 보고 판단을 했어야 했다.
// 그리고 문자열을 정수로, 정수를 문자열로 변환하는 방법을 제대로 기억하고 있어야할 거 같다.

import Foundation

func solution(_ s:String) -> String {
    var sArray = Array(s).map { String($0).lowercased() }
    if sArray[0].isAlpha { sArray[0] = sArray[0].uppercased() }

    for i in 1..<s.count {
        if sArray[i-1] == " ", sArray[i].isAlpha {
            sArray[i] = sArray[i].uppercased()
        }
    }
    return sArray.joined()
}

extension String {
    var isAlpha: Bool {
        guard let value = Character(self).asciiValue else { return false }
        if (value >= 65 && value <= 90) || (value >= 97 && value <= 122) { return true }
        else { return false }
    }
}

// 처음 풀이
// func solution(_ s:String) -> String {
//     if s.allSatisfy({ $0 == " " }) { return s }
//     return s.components(separatedBy: " ").map {
//         var sArray = Array($0).map { $0.lowercased() }
//         if let value = Character(sArray[0]).asciiValue, value >= 97 && value <= 122 {
//            sArray[0] = sArray[0].uppercased()
//         }
//         return sArray.joined()
//     }.joined(separator: " ")
// }