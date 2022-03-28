// 숫자 문자열과 영단어

import Foundation

func solution(_ s:String) -> Int {
    let stringToIntDict = ["zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    let stringArray = Array(s).map{ String($0) }
    var subString = ""
    var answer = ""
    for word in stringArray {
        if 97 <= Int(Character(word).asciiValue!) && Int(Character(word).asciiValue!) <= 122 {
            subString += word
            if stringToIntDict[subString] != nil {
                answer += stringToIntDict[subString]!
                subString = ""
            }
        } else {
            subString = ""
            answer += word
        }
    }
    return Int(answer)!
}