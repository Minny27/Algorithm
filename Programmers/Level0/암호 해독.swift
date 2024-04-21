// 암호 해독

import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    var answer = ""
    
    for i in stride(from: code-1, to: cipher.count, by: code) {
        let index = cipher.index(cipher.startIndex, offsetBy: i)
        answer += String(cipher[index])
    }
    
    return answer
}