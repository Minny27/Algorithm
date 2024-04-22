// 대문자와 소문자

import Foundation

func solution(_ my_string:String) -> String {
    return my_string.map { $0.isLowercase ? $0.uppercased() : $0.lowercased() }.joined()
}