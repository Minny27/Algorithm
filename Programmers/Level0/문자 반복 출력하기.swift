// 문자 반복 출력하기

import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    var answer = ""
    for s in my_string {
        answer += String(repeating: s, count: n)
    }
    return answer
}