// 암호 만들기

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = input[0], n = input[1]
let array = readLine()!.split(separator: " ").map { String($0) }.sorted()
var visited = Array(repeating: false, count: n)
let vowels: [Character] = ["a","e","i","o","u"]
var answer = ""

func canPassword(_ value: String) -> Bool {
    var vowelCount = 0
    for vowel in vowels {
        if value.contains(vowel) { vowelCount += 1 }
    }
    
    if vowelCount < 1 || value.count - vowelCount < 2 { return false }
    return true
}

func combination(_ substring: String, _ index: Int, _ count: Int, _ totalCount: Int) {
    if count == totalCount && canPassword(substring) {
        answer += substring + "\n"
        return
    }
    
    for i in stride(from: index, to: n, by: 1) {
        if visited[i] { continue }
        visited[i] = true
        combination(substring + array[i], i, count + 1, totalCount)
        visited[i] = false
    }
}

func solution() {
    combination("", 0, 0, m)
    print(answer)
}

solution()
