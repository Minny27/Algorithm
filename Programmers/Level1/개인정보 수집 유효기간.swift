// 2023 KAKAO BLIND RECRUITMENT - 개인정보 수집 유효기간
// 문제 유형: 구현
// 느낀점: 날짜나 시간을 분리하고 합치는 함수를 만들어 놓고 외워야겠다고 생각.
// 무분별하게 함수를 정의하면 함수명이나 파라미터 이름을 확인하려고 왔다갔다하는 시간이 많아짐.
// 타입을 만들 때는 typealias를 사용하고 반복적으로 사용하는 함수가 아니면
// 웬만하면 solution() 함수안에서 구현하는 것이 시간을 단축할 수 있는 것 같다.
// 그리고 강제 형변환을 사용하지 말고 '??', 'if let', 'guard let'을 사용하자!

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var answers = [Int]()
    let today = getDayInt(today)
    var termsDict = [String: Int]()
    
    terms.forEach {
        let split = $0.components(separatedBy: " ")
        let type = split[0]
        let dueMonth = Int(split[1]) ?? 0
        termsDict[type] = dueMonth
    }
    
    for (i, privacy) in privacies.enumerated() {
        let split = privacy.components(separatedBy: " ")
        let start = getDayInt(split[0])
        let type = split[1]
        guard let dueMonth = termsDict[type] else { return [] }
        if today >= start + dueMonth * 28 { answers.append(i + 1) }
    }
    
    return answers
}

private func getDayInt(_ today: String) -> Int {
    let split = today.components(separatedBy: ".")
    let year = (Int(split[0]) ?? 0) * 28 * 12
    let month = (Int(split[1]) ?? 0) * 28
    let day = Int(split[2]) ?? 0
    return year + month + day
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])) // [1, 3]
print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"])) // [1, 4, 5]