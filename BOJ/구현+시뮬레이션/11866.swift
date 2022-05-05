// 요세푸스 문제 0

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])
var array = Range(1...n).map { Int($0) }
var index = 0
var answer = "<"

while !array.isEmpty {
    index = (index + k - 1) % array.count
    answer += String(array.remove(at: index)) + ", "
}

answer.removeLast()
answer.removeLast()

print(answer + ">")