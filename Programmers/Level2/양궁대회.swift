// 양궁대회
// 문제 유형: 정수론(중복조합), dfs
// 시간 초과 문제는 해결했는데 실패가 계속 뜸. 아직 이유를 모르겠음.
// 이전에 이모티콘 할인행사와 비슷하지만,
// 이 문제는 중복 조합이기 때문에 현재 인덱스부터 깊이 우선 탐색 시작

// 42% 성공 코드
// import Foundation

// func solution(_ n:Int, _ info:[Int]) -> [Int] {
//     var maxScore = 0
//     var maxResult = [0,0,0,0,0,0,0,0,0,0,0]
    
//     func dfs(_ count: Int, _ index: Int, _ shots: [Int]) {
//         if count == n {
//             var riot = 0
//             var apeach = 0
            
//             for i in 0..<11 {
//                 if shots[i] == info[i] && info[i] == 0 { continue }
//                 if shots[i] > info[i] { riot += 10 - i }
//                 else { apeach += 10 - i }
//             }
            
//             if apeach >= riot { return }
            
//             var shots = shots
//             let sum = shots.reduce(0, {$0+$1})
//             if sum < n { shots[10] = n - sum }
            
//             if maxScore < riot {
//                 maxScore = riot
//                 maxResult = shots
//             } else if maxScore == riot {
//                 for i in stride(from: 10, to: -1, by: -1) {
//                     if maxResult[i] < shots[i] {
//                         maxResult = shots
//                     } else { break }
//                 }
//             }
//             return
//         }
        
//         for i in index..<11 {

//             if n - count < info[i] { continue }
//             var shots = shots
//             shots[i] = info[i] + 1
//             dfs(count + shots[i], i, shots)
//         }
//     }
    
//     dfs(0, 0, [0,0,0,0,0,0,0,0,0,0,0])
//     return maxResult.reduce(0, {$0+$1}) == 0 ? [-1] : maxResult
// }