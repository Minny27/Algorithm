// 마법의 엘리베이터
// 문제 유형: 구현, 수학
// 처음에는 5이상이면 무조건 반올림해도 된다고 생각해서 문제를 해결하지 못했음..
// 예시 힌트를 받아서 생각해보니 풀 수 있었음...
// 16
// (올림)20 -> 0 => 4 + 2 = 6
// (내림)6 -> 0 => 1 + 6 = 7

// 65
// (올림)70 -> -30 -> 0 => 5 + 1 + 3 = 9
// (내림)5 -> 0 => 6 + 5 = 11

// 55
// (올림)60 -> -40 -> 0 => 5 + 1 + 4 = 10
// (내림)5 -> 0 => 10

// 95
// (올림)100 -> 0 => 5 + 1 = 6
// (내림)90 -> -10 -> 0 => 5 + 1 + 1 = 7
// => 나머지가 6이상이면 올림 또는 나머지가 5이면서 몫의 마지막 수가 5이상이면 올림, 그 이외 내림

import Foundation

func solution(_ storey:Int) -> Int {
    var s = storey
    var answer = 0
    
    while s != 0 {
        let r = s % 10 // 수의 마지막 값
        
        // r이 6이상이거나 r이 5이면서 몫의 마지막 값(r의 한자리 윗자리수)가 5이상이면 올림
        if r > 5 || (r == 5 && (s / 10) % 10 >= 5) { 
            s += 10 - r
            answer += 10 - r
        }
        // 그 이외는 내림
        else { answer += r }
        s /= 10
    }
    
    return answer
}

// 이전 실패 풀이
// func solution(_ storey:Int) -> Int {
//     var s = storey
//     var l = String(s).count
//     var answer = 0
    
//     while s != 0 {
//         let d = Int((round(Double(s) / pow(10.0, Double(l-1))) * pow(10.0, Double(l-1))))
//         answer += d / Int(pow(10.0, Double(l-1)))
//         s = abs(s-d)
//         l -= 1
//     }   
//     return answer
// }