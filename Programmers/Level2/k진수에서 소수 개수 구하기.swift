// k진수에서 소수 개수 구하기
// 문제 유형: 수학 - 진수, 소수
// 느낀점: 0P0, P0, 0P, P인데 왜 P는 안 된다고 생각하고 풀었을까..
// 처음에는 0을 기준으로 자르면 안 된다고 생각했는데 풀고 나서 보니까 상관없었음.
// 풀이 방법: 문자열을 0 기준으로 자르고 int로 반환
// 정수형 배열을 반복하면서 각 값 중에서 1을 제외한 값이 소수이면 answer += 1

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var answer = 0
    
    let str = String(n, radix: k)
    let intArr = str.split(separator: "0").map { Int(String($0))! }
    
    for num in intArr {
        if num == 1 { continue }
        if isPrime(num) { answer += 1 }
    }
    
    return answer
}

func isPrime(_ n: Int) -> Bool {
    let end = Int(sqrt(Double(n))) + 1 
    for i in 2..<end {
        if n % i == 0 { return false }
    }
    return true
}

// 이전 풀이
// import Foundation

// func solution(_ n:Int, _ k:Int) -> Int {
//     var answer = 0
    
//     let str = String(n, radix: k)
//     var tmp = ""
    
//     for (i,s) in str.enumerated() {
//         let num = s.wholeNumberValue ?? 0
        
//         if num == 0 {
//             if isPrime(Int(tmp) ?? 1) { answer += 1 }
//             tmp = ""
//             continue
//         } else if i == str.count-1 {
//             tmp += String(s)
//             if isPrime(Int(tmp) ?? 1) { answer += 1 }
//         }
//         tmp += String(s)
//     }
    
//     return answer
// }

// func isPrime(_ n: Int) -> Bool {
//     if n == 1 { return false }
//     let end = Int(sqrt(Double(n))) + 1
//     for i in 2..<end {
//         if n % i == 0 { return false }
//     }
//     return true
// }
