// 모음 제거
// 느낀 점: 정규표현식이 제일 깔끔해보였지만, filter를 사용하는 게 제일 속도가 빨랐음.
// 속도는 filter > 내 풀이 > 정규표현식 순

import Foundation

func solution(_ my_string:String) -> String {
    return my_string.replacingOccurrences(of: "a", with: "").replacingOccurrences(of: "e", with: "").replacingOccurrences(of: "i", with: "").replacingOccurrences(of: "o", with: "").replacingOccurrences(of: "u", with: "")
}


// 다른 사람 플이
// import Foundation

// func solution(_ my_string:String) -> String {
//     return my_string.replacingOccurrences(of: "[aeiou]", with: "", options: .regularExpression)
// }

// import Foundation

// func solution(_ my_string:String) -> String {
//     return my_string.filter { !["a", "e", "i", "o", "u"].contains($0)}
// }