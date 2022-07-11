// 주유소

let n = Int(readLine()!)!
let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
let vertex = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution() {
    var min = vertex[0]
    var answer = 0
    
    for i in 0..<n-1 {
        answer += min * edge[i]
        if min > vertex[i+1] {
            min = vertex[i+1]
        }
    }
    print(answer)
}

solution()
