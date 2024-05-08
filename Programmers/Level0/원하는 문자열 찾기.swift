// 원하는 문자열 찾기

import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    return myString.lowercased().contains(pat.lowercased()) ? 1 : 0
}