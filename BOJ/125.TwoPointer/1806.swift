// 부분합
// 시간 : 20분

let data = readLine()!.split(separator: " ").map{Int(String($0))!}
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var minLen = Int.max // 답
var tmpSum = 0
var s = -1 // -1부터 시작하는 이유 -> while문에 들어갈 때 s += 1을 하고 시작하기 위해서
var e = 0

while s < arr.count && e < arr.count { // 종료 조건
    s += 1
    if s >= arr.count {
        break
    }
    tmpSum += arr[s]
    if tmpSum >= data[1] {
        minLen = min(minLen, s - e + 1)
        tmpSum -= arr[e]
        tmpSum -= arr[s]
        e += 1
        s -= 1
    }
}
print(minLen == Int.max ? 0 : minLen)