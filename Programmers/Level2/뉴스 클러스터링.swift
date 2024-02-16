// 뉴스 클러스터링
// 문제 유형: 자료구조(set, dict), 문자열
// 느낀점: 왜 콤비네이션 집합을 구해야한다고 생각했을까.. 문제 제대로 읽자
// 풀이 방법: 두 집합의 교집합과 합집합을 구하는데 set을 생각했다가
// 중복 값이 있는 경우를 어떻게 처리해야 할 지 도무지 모르겠어서
// 집합 A를 반복하면서 집합 B에 키 해당 키가 있는 지 확인해서
// 있으면(교집합) 두 값 중 작은 값은 interCount에 더하고, 큰 값은 uniCount에 더하기
// 그리고 이에 해당하지 않는 부분 A-B는 uniCount에 더하기
// B-A도 마찬가지로 uniCount에 더하기
// 최종적으로 uniCount가 0이 되는 경우(분모 0)은 65536
// 그 이외의 값은 Double(interCount) / Duble(uniCount) * 65536

func solution(_ str1:String, _ str2:String) -> Int {
    let strArr1 = str1.map { $0.lowercased() }
    let strArr2 = str2.map { $0.lowercased() }
    var combi1 = [String]()
    var combi2 = [String]()
    var dict1 = [String:Int]()
    var dict2 = [String:Int]()
    var interCount = 0
    var uniCount = 0
    
    for i in 1..<strArr1.count {
        if Character(strArr1[i-1]).isLetter && Character(strArr1[i]).isLetter {
            combi1.append(strArr1[i-1]+strArr1[i])
        }
    }
    
    for i in 1..<strArr2.count {
        if Character(strArr2[i-1]).isLetter && Character(strArr2[i]).isLetter {
            combi2.append(strArr2[i-1]+strArr2[i])
        }
    }
    
    for v in combi1 {
        dict1[v, default: 0] += 1
    }
    
    for v in combi2 {
        dict2[v, default: 0] += 1
    }
    
    for (k,v1) in dict1 {
        if let v2 = dict2[k] { // A && B
            interCount += min(v1,v2)
            uniCount += max(v1,v2)
            dict2.removeValue(forKey: k)
        } else { uniCount += v1 } // A - B
    }
    uniCount += dict2.values.reduce(0, +) // B - A
    
    return uniCount == 0 ? 65536 : Int(Double(interCount) / Double(uniCount) * 65536)
}

// 이전 풀이
// func solution(_ str1:String, _ str2:String) -> Int {
//     let combi1 = combi(str1.filter { $0.isLetter }.map { $0.lowercased() }, 2)
//     let combi2 = combi(str2.filter { $0.isLetter }.map { $0.lowercased() }, 2)
//     var dict1 = [String:Int]()
//     var dict2 = [String:Int]()
//     var interCount = 0
//     var uniCount = 0
    
//     for v in combi1 {
//         dict1[v, default: 0] += 1
//     }
    
//     for v in combi2 {
//         dict2[v, default: 0] += 1
//     }
    
//     for (k,v1) in dict1 {
//         if let v2 = dict2[k] {
//             interCount += min(v1,v2)
//             uniCount += max(v1,v2)
//             dict2.removeValue(forKey: k)
//         }
//     }
//    uniCount += dict2.values.reduce(0, +)
    
//     return Int(Double(interCount) / Double(uniCount) * 65536)
// }

// func combi(_ arr: [String], _ count: Int) -> [String] {
//     var visited = Array(repeating: false, count: arr.count)
//     var strArr = [String]()
    
//     func run(_ sub: [String], _ index: Int) {
//         if sub.count == count {
//             strArr.append(sub.joined())
//             return
//         }   
        
//         for i in index..<arr.count {
//             if visited[i] { continue }
//             visited[i] = true
//             var newArr = sub
//             newArr.append(arr[i])
//             run(newArr, i + 1)
//             visited[i] = false
//         }
//     }
//     run([], 0)
//     return strArr
// }