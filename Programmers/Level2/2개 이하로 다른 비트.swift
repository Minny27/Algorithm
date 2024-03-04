// 2개 이하로 다른 비트
// 문제 유형: 수학(비트 연산)
// 풀이 시간: 1시간
// 느낀점: 비트 마스킹은 어려워.....
// 풀이 방법: 
// 처음 풀이는 이랬다.
// 1. 0을 포함 O -> 가장 작은 위치에 있는 0을 뒤집기
// 2. 0 포함 x -> 맨앞에 1, 뒤에 0
// 위와 같이 풀면 차이가 2개 일 때를 고려하지 못했음..
// 이 문제는 나중에 비트마스킹으로 다시 풀어봐야 할 듯..
// 다른 사람들 풀이가 이해가 잘 안 됨

import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    var answer = [Int64]()

    for n in numbers {
        var str = String(n, radix: 2)
        if n % 2 == 0 || str.filter({ $0 == "0" }).count == str.count-1 { answer.append(n+1) }
        else {
            if str.filter({ $0 == "1" }).count == str.count { 
                str.replaceSubrange(str.startIndex...str.startIndex, with: "0")    
                str.insert("1", at: str.startIndex)
                let value = Int64(str, radix: 2) ?? 0
                answer.append(value)
                continue
            }
            guard let zero = str.lastIndex(of: "0") else { return [] }
            let first = str.index(zero, offsetBy: 1)
            str.replaceSubrange(zero...zero, with: "1")
            str.replaceSubrange(first...first, with: "0")
            let value = Int64(str, radix: 2) ?? 0
            answer.append(value)
        }
    }

    return answer
}

// 두 번째 풀이
// 1. 짝수 -> + 1
// 2. 홀수 && 1로만 이루어진 수 -> 맨 앞의 1을 0으로 바꾸고 앞에 1추가
// 3. 그 이외 -> 마지막으로 0이 나오는 위치와 오른쪽 1을 스왑
// 처음에는 마지막으로 나오는 0을 1로 바꿔주면 된다고 생각했는데, 마지막 0과 오른쪽 1을 스왑한게 더 작음..

// 이전 풀이
// import Foundation

// func solution(_ numbers:[Int64]) -> [Int64] {
//     var answer = [Int64]()
    
//     for n in numbers {
//         var str = String(n, radix: 2)
//         if let index = str.lastIndex(of: "0") {
//             str.replaceSubrange(index...index, with: "1")
//         } else {
//             let index = str.startIndex
//             str.replaceSubrange(index...index, with: "0")
//             str.insert("1", at: str.startIndex)
//         }
//         let value = Int64(Int(str, radix: 2) ?? 0)
//         answer.append(value)
//     }
//     return answer
// }