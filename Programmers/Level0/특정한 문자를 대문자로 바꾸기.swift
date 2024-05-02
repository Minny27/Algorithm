// 특정한 문자를 대문자로 바꾸기

import Foundation

func solution(_ my_string:String, _ alp:String) -> String {
    return my_string.replacingOccurrences(of: alp, with: alp.uppercased())
}