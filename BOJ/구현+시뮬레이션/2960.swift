// 에라토스테네스의 체

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = data[0], k = data[1]
var answer = [Int]()


func eratos() {
    var visited = Array(repeating: false, count: n + 1)
    
    for i in 2...n {
        if visited[i] { continue }
        answer.append(i)
        for j in stride(from: i + i, to: n + 1, by: i) {
            if visited[j] { continue }
            visited[j] = true
            answer.append(j)
        }
    }
    print(answer[k - 1])
}

eratos()
