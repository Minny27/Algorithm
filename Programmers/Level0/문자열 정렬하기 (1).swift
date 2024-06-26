// 문자열 정렬하기 (1)

import Foundation

func solution(_ my_string:String) -> [Int] {
    return my_string.filter { $0.isNumber }.map { Int(String($0))! }.sorted()
}