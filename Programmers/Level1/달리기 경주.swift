// 달리기 경주
// 문제 유형: 자료구조(딕셔너리), 구현
// 느낀점: 플레이어 이름과 순위가 각각 고유하다는 것을 망각하고 풀이방식을 생각하는데 오래 걸림.

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var stringKeyDict = [String: Int]()
    var intKeyDict = [Int: String]()
    
    for i in 0..<players.count {
        stringKeyDict[players[i]] = i
        intKeyDict[i] = players[i]
    }
    
    for calling in callings {
        let rank = stringKeyDict[calling] ?? 0 // 불린 애 랭킹
        let frontName = intKeyDict[rank-1] ?? "" // 이전 이름
        
        (intKeyDict[rank-1], intKeyDict[rank]) = (calling, frontName)
        (stringKeyDict[calling], stringKeyDict[frontName]) = (rank-1, rank)
    }
    
    return stringKeyDict.sorted(by: { $0.value < $1.value }).map { $0.key }
}

