// 소수의 연속합

let n = Int(readLine()!)!
let max = 4000000
var primeArray = [Int]()

func eratos() {
    var visited = Array(repeating: false, count: max + 1)
    
    for i in 2...max {
        if visited[i] { continue }
        primeArray.append(i)
        for j in stride(from: i+i, through: max, by: i) {
            visited[j] = true
        }
    }
}

func twoPointer() {
    var l = 0
    var r = 0
    var subSum = 0
    var answer = 0
    
    while r < primeArray.count {
        if subSum + primeArray[r] <= n {
            subSum += primeArray[r]
            r += 1
        } else {
            subSum -= primeArray[l]
            l += 1
        }
        
        if subSum == n {
            answer += 1
        }
    }
    print(answer)
}

eratos()
twoPointer()