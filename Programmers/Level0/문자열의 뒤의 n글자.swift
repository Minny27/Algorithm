// 문자열의 뒤의 n글자

import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    return String(my_string.suffix(n))
}