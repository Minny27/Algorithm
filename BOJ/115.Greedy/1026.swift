// 보물

import Foundation

let n = Int(readLine()!)!
var arrayA = readLine()!.split(separator: " ").map { Int(String($0))! }
var arrayB = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0

arrayA.sort(by: <)
arrayB.sort(by: >)

for i in 0..<arrayA.count {
    answer += arrayA[i] * arrayB[i]
}

print(answer)