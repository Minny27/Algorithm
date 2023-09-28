// 숫자 짝궁
// 문제 유형: 문자열
// 6 ~ 10까지 테스트 케이스가 틀려서 왜 틀렸는지 몰랐는데..
// "000"을 "0"으로 처리하기 위해서 String(Int(str) ?? 0) 으로 구현했는데
// 질문을 봐서 알았는데 문자열 길이가 3백만이라 정수형 범위를 넘어설 수 있음....
// 그래서 String.allSatisfy()함수로 걸러냈음...
// 추가적으로 set의 intersaction으로 공통 문자열을 걸러내고
// 공통 key를 a, b 컬렉션에서 최소 개수를 문자열에 더하는 방식으로 풀 수 있다는 것을 알게 됨

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var dict = [Character: Int]()
    var arr = [Character]()
    for v in X {
        if let _ = dict[v] {
            dict[v]! += 1
        } else {
            dict[v] = 1
        }
    }
    
    for v in Y {
        if let _ = dict[v] {
            dict[v]! -= 1
            arr.append(v)
            if dict[v] == 0 { dict[v] = nil }
        }
    }
    
    arr.sort(by: >)
    
    return arr.isEmpty ? "-1" : String(arr).allSatisfy { $0 == "0" } ? "0" : String(arr)
}

// 다른 사람 풀이
// func solution(_ X:String, _ Y:String) -> String {
//     let arr1 = Array(X)
//     let arr2 = Array(Y)
//     let uniqueKey = Set(arr1).intersection(Set(arr2))
//     var answer = ""
//     for key in uniqueKey.sorted(by: >) {
//         answer += String(repeating: key, count: min(arr1.filter{$0 == key}.count, arr2.filter{$0 == key}.count))
//     } 
//     return answer == "" ? "-1" : ((uniqueKey.count == 1 && uniqueKey.contains("0")) ? "0" : answer)
// }