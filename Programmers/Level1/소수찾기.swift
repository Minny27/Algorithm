// 소수 찾기

var visited = Array(repeating: false, count: 1000000 + 1)
var inf = 1000000

func findPrimeNumber(_ n: Int) {
    for i in 2...n {
        if visited[i] { continue }
        for j in stride(from: i + i, through: n, by: i) {
            visited[j] = true
        }
    }
}

func solution(_ n:Int) -> Int {
    var answer = 0
    
    findPrimeNumber(n)
    
    for i in 2...n {
        if !visited[i] {
            answer += 1
        }
    }
    
    return answer
}