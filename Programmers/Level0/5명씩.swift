// 5명씩
// 느낀점: stride 함수를 몰랐던 건 아닌데.. 기록 해놓자!

import Foundation

func solution(_ names:[String]) -> [String] {
    var answer = [String]()
    for i in stride(from: 0, to: names.count, by: 5) {
        answer.append(names[i])
    }
    return answer
}

// 다른사람 풀이
// func solution(_ names:[String]) -> [String] {
//     stride(from: 0, to: names.count, by: 5).map { names[$0] }
// }