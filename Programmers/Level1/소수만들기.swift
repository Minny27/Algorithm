// 소수 만들기

import Foundation

var visited = Array(repeating: false, count: 50001)
var inf = 50000

func findPrimeNumber() {
    for i in 2..<inf {
        if visited[i] { continue }
        for j in stride(from: i+i, to: inf, by: i) {
            if !visited[j] { break }
            visited[j] = true
        }
    }
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    findPrimeNumber()
    
    for i in 0..<nums.count-2 {
        let one = nums[i]
        for j in i+1..<nums.count-1 {
            let two = nums[j]
            for k in j+1..<nums.count {
                let three = nums[k]
                let number = one + two + three
                if !Solution.visited[number] {
                    answer += 1
                }
            }
        }
    }

    return answer
}