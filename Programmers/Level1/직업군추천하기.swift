// 직업군 추천하기
// 시간 : 40분

import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var ans = ""
    var maxValue = 0
    var dict: [String: Int] = [:]
    for index in 0..<languages.count {
        dict[languages[index]] = preference[index]
    }
    
    for i in 0..<table.count {
        var sum = 0
        let rowArray = table[i].split(separator: " ").map{String($0)}
        for j in 1..<rowArray.count {
            if let languagePreference = dict[rowArray[j]] {
                sum += languagePreference * (rowArray.count - j)
            }
        }
        if maxValue == sum {
            if ans > rowArray[0] {
                maxValue = sum
                ans = rowArray[0]
            }
        }
        else if maxValue < sum{
            maxValue = sum
            ans = rowArray[0]
        }
    }

    return ans
}