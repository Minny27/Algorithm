// 가장 긴 바이토닉 부분 수열

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
var frontDP = [Int](repeating: 1, count: n)
var backDP = [Int](repeating: 1, count: n)
var answer = 1

for i in 0 ..< n {
    for j in i + 1 ..< n {
        if array[i] < array[j] {
            frontDP[j] = max(frontDP[j], frontDP[i] + 1)
        }
    }
}

for i in stride(from: n - 1, to: -1, by: -1) {
    for j in stride(from: i - 1, to: -1, by: -1) {
        if array[i] < array[j] {
            backDP[j] = max(backDP[j], backDP[i] + 1)
        }
    }
}

for i in 0..<n {
    answer = max(answer, frontDP[i] + backDP[i] - 1)
}

print(answer)