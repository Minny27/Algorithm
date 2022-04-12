// 단어 정렬

let n = Int(readLine()!)!
var array = Set<String>()

for _ in 0..<n {
    array.insert(readLine()!)
}

for word in array.sorted(by: { ($0.count, $0) < ($1.count, $1) }) {
    print(word)
}
