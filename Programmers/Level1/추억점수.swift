// 추억점수
// 문제 유형: 자료구조(해시)
// 느낀점: Dictionary(uniqueKeysWithValues: )와 reduce 클로저를 사용했으면 더 간결했을 것.

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var answer = [Int]()
    var dict = [String: Int]()

    for i in 0..<name.count {
        let name = name[i]
        let yearning = yearning[i]
        dict[name] = yearning
    }

    for eachPhoto in photo {
        var sum = 0
        for person in eachPhoto {
            if let value = dict[person] {
                sum += value
            }
        }
        answer.append(sum)
    }

    return answer
}