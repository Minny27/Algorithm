// 압축
// 문제 유형: 구현, 문자열, 딕셔너리
// 느낀점: 문자열 반복 및 슬라이싱에 취약한 느낌을 많이 받음...
// 왜 for문 한 번으로 해결할 수 있는 방법을 생각하지 못했을지..
// 풀이 방법: 처음에는 투 포인터 형식으로 문제를 해결했음.
// 하지만, 마지막에 값이 하나 남거나, 마지막 값을 포함하고 있을 떄에 대한 처리를 따로 해줬어야함.
// 다른 사람의 풀이를 보니, 이전 값(past)를 while문 밖에 선언하고 포함하고 있으면 past에 값을 추가하고
// 값을 포함하고 있지 않으면, now의 값을 dict에 추가하고, answer에 dict[past]를 append 후, 현재 위치의 값으로 past를 갱신.
// 그리고 while문이 끝나고 나서 마지막 값을 append <= 이게 포인트

func solution(_ msg:String) -> [Int] {
    let msgArr = msg.map { String($0) }
    let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var alphaDict = Dictionary(uniqueKeysWithValues: zip(str, Range(1...26)))
    var answer = [Int]()
    var i = 0
    var past = ""
    while i < msgArr.count {
        let now = past + msgArr[i]
        if let _ = alphaDict[now] {
            past += msgArr[i]
        } else {
            alphaDict[now] = alphaDict.count + 1
            answer.append(alphaDict[past]!)
            past = msgArr[i]
        }
        i += 1
    }
    answer.append(alphaDict[past]!)
    
    return answer
}

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