// 숨어있는 숫자의 덧셈
// 느낀 점: CompactMap은 생각도 못함요..

import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.filter { $0.isNumber }.map { Int(String($0))! }.reduce(0, +)
}

// 다른 사람 풀이
// import Foundation

// func solution(_ my_string:String) -> Int {
//     return my_string.compactMap { Int(String($0)) }.reduce(0, +)
// }