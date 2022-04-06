let n = Int(readLine()!)!
var answer = [String]()

for i in 0..<n {
    if i == 0 {
        answer = Array(readLine()!).map { String($0) }
        continue
    }
    
    let stringArray = Array(readLine()!).map { String($0) }
    
    for j in 0..<answer.count {
        if answer[j] != stringArray[j] {
            answer[j] = "?"
        }
    }
}
print(answer.joined())