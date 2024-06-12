// 글자 이어 붙여 문자열 만들기

import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    let array = Array(my_string)
    return index_list.map { String(array[$0]) }.joined()
}