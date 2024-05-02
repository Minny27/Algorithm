// 공백으로 구분하기 1

import Foundation

func solution(_ my_string:String) -> [String] {
    return my_string.components(separatedBy: " ")
}