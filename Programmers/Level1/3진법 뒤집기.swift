// 3진법 뒤집기
// 진법 오랜만..
// 충격적인 풀이를 발견..
// Int 또는 String으로 캐스팅할 때 radix를 통해서 진수로 변환할 수 있음.
// 여기서 포인트는 Int -> String, String -> Int로 변환됨

import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3) ?? 0
}

// 이전 풀이
// func solution(_ n:Int) -> Int {
//     var n = n
//     var s = ""
//     while n > 0 {
//       s += String(n % 3)
//       n = n / 3
//     }
//     return Int(s.enumerated().map { pow(3.0, Double(s.count-1-$0.offset)) * (Double(String($0.element)) ?? 0) }.reduce(0, +))
// }