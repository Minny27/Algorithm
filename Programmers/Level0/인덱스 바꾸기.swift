// 인덱스 바꾸기

import Foundation

func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    var array = my_string.map { String($0) }
    array.swapAt(num1, num2)
    return array.joined()
}