// 압춥

// 이전 풀이
func solution(_ msg:String) -> [Int] {
    let msgArr = msg.map { String($0) }
    let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var alphaDict = Dictionary(uniqueKeysWithValues: zip(str, Range(1...26)))
    var count = 27
    var answer = [Int]()
    var i = 0
    
    while i < msgArr.count {
        var w = msgArr[i]
        for j in i+1..<msg.count {
            if let _ = alphaDict[w + msgArr[j]] {
                w += msgArr[j]
                i += 1
                if i == msgArr.count-1 {
                    answer.append(alphaDict[w]!)
                    return answer
                }
            } else {
                answer.append(alphaDict[w]!)
                alphaDict[w + msgArr[j]] = count
                count += 1
                break
            }
        }
        
        if i == msgArr.count-1 {
            let value = msgArr[msgArr.count-1]
            answer.append(alphaDict[value]!)
            break
        }
        
        i += 1
    }
    
    return answer
}