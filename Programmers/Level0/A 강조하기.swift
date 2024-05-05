// A 강조하기

import Foundation

func solution(_ myString:String) -> String {
    return myString.lowercased().replacingOccurrences(of: "a", with: "A")
}

// 이전 풀이
// import Foundation
// func solution(_ myString:String) -> String {
//     return myString.map { $0 == "a" || $0 == "A" ? "A" : $0.lowercased() }.joined()
// }