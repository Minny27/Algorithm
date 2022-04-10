// N과 M (1)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var visited = Array(repeating: false, count: n + 1)
var answer = ""

func permu(_ result: String, _ count: Int) {
    if count == m {
        answer += result + "\n"
        return
    }
    
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            permu(result + "\(i) ", count + 1)
            visited[i] = false
        }
    }
}

permu("", 0)
print(answer)
