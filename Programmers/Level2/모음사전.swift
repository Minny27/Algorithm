import Foundation

func solution(_ word:String) -> Int {
    let vowel = ["A", "E", "I", "O", "U"]
    var wordArray = [String]()
    var k = 1
    var check = false
    
    func dfs(_ tmpWord: String) {
        if tmpWord != "" {
            wordArray.append(tmpWord)
        }
        if tmpWord.count < 5 {
            for i in 0..<5 {
                if tmpWord + vowel[i] == word {
                    check = true
                }
                if !check {
                    k += 1
                    dfs(tmpWord + vowel[i])
                }
            }
        }
    }
    
    dfs("")
    return k
}

print(solution("AAAAE"))
