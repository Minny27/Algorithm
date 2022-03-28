// 음양 더하기

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    
    for i in 0..<signs.count {
        if signs[i] {
            sum += absolutes[i]
        } else {
            sum -= absolutes[i]
        }
    }    
    return sum
}