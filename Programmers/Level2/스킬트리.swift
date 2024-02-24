// 스킬트리
// 문제 유형: 문자열
// 느낀점: 일일이 비교해서 해나가면 된다고 생각했는데.. 생각보다 오래 걸림
// skill_trees의 원소에 skill이 온전히 있지 않은 케이스를 나누는 부분에서 시간을 많이 썼음
// 풀이 방법: 이전 풀이에서는 alpha에 따른 숫자를 찾기 위한 alphaDict, 반대인 numberDict를 만들고
// 알바벳에 순서대로 번호를 매김
// skill_trees의 tree를 순회하면서 skill set을 만들고 skill_trees의 문자열을 순회하면서
// set에 포함된 값이면, 해당 문자열의 현재 위치+1부터 끝까지 확인하면서 해당 문자의 순서보다 더 큰 지를 확인
// 더 크면 flag = true로 해서 해당 문자열은 답이 아님.
// 그렇게 해서 모든 set의 count가 0이 되면 답이고, 모든 값을 순회했으면 treeSet에는 모든 값을 지우게 되서
// treeSet에 모든 값이 지워질 때 또한 답이 됨.
// skill에 순서는 맞지만, 모든 스킬이 안 나온 케이스를 처리하기 위함.

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var answer = 0
    
    for tree in skill_trees {
        let str = tree.filter { skill.contains($0) }
        if skill.starts(with: str) { answer += 1 }
    }
    
    return answer
}

// 이전 풀이
// import Foundation

// func solution(_ skill:String, _ skill_trees:[String]) -> Int {
//     let alphaDict = Dictionary(uniqueKeysWithValues: zip(Array(skill), Range(0...skill.count)))
//     let numberDict = Dictionary(uniqueKeysWithValues: zip(Range(0...skill.count), Array(skill)))
//     var answer = 0
    
//     for tree in skill_trees {
//         let treeArr = tree.map { $0 }
//         var treeSet = Set(treeArr)
//         var skillSet = Set(Array(skill))
//         var flag = false
        
//         for i in 0..<tree.count {
//             if flag { break }
//             let s = treeArr[i]
//             if let n = alphaDict[s] {
//                 if skillSet.count + n != skill.count {
//                     flag = true
//                     break
//                 }
                
//                 for j in i+1..<tree.count {
//                     let alpha = treeArr[j]
//                     if let v = alphaDict[alpha], v < n {
//                         flag = true
//                         break
//                     }
//                 }
//                 skillSet.remove(s)
//             }
//             treeSet.remove(s)
//         }
//         if skillSet.isEmpty || treeSet.isEmpty { answer += 1 }
//     }
    
//     return answer
// }