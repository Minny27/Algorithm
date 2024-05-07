// 소문자로 바꾸기

import Foundation

func solution(_ myString:String) -> String {
    return myString.map { $0.lowercased() }.joined()
}