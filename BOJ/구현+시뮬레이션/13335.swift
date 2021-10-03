// 트럭

import Foundation

let data = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let (n, w, l) = (data[0], data[1], data[2])
let arr = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
var q = [[Int]]()
var index = 0
var time = 0
var sum = 0

while index < arr.count || !q.isEmpty {
    if index < arr.count && arr[index] > l {
        index += 1
        continue
    }

    time += 1

    if !q.isEmpty && q[0][1] + w <= time {
        sum -= q.removeFirst()[0]
    }

    if index < arr.count && sum + arr[index] <= l && q.count < w {
        q.append([arr[index], time])
        sum += arr[index]
        index += 1
    }
}

print(time)