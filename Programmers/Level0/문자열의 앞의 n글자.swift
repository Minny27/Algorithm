// 문자열의 앞의 n글자

import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    return String(my_string.dropLast(my_string.count - n))
}

// 다른 사람 풀이
func solution(_ my_string:String, _ n:Int) -> String {
    return String(my_string.prefix(n))
}