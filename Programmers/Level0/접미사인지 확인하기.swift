// 접미사인지 확인하기

import Foundation

func solution(_ my_string:String, _ is_suffix:String) -> Int {
    return my_string.hasSuffix(is_suffix) ? 1 : 0
}