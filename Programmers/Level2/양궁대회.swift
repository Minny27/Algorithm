// 양궁대회
// 문제 유형: 정수론(중복조합), dfs
// 시간 초과 문제는 해결했는데 실패가 계속 뜸. 아직 이유를 모르겠음.
// 이전에 이모티콘 할인행사와 비슷하지만,
// 이 문제는 중복 조합이기 때문에 현재 인덱스부터 깊이 우선 탐색 시작
// 일단 라이엇과 어피치의 점수 차이를 기준으로 비교했어야하는데 그 부분 간과.
// + 답이 같을 때, 더 작은 값이 많은 순으로 값을 출력할 때 같은 위치에 있는 값이 같을 때, continue를 안 했었다...
// 그리고 화살이 남는 경우에 0에 몰아주는 코드는 추후에 더 고민해봐야할 거 같다.. 머리가 안 돌아간다...

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var maxDiff = 0
    var maxResult = [0,0,0,0,0,0,0,0,0,0,0]
    
    func dfs(_ count: Int, _ index: Int, _ shots: [Int]) {
        if count == n {
            var ryan = 0
            var apeach = 0
            
            for i in 0..<11 {
                if shots[i] == info[i] && info[i] == 0 { continue }
                if shots[i] > info[i] { ryan += 10 - i }
                else { apeach += 10 - i }
            }
            
            let diff = ryan - apeach
            if diff <= 0 { return }
            
            var shots = shots
            let sum = shots.reduce(0, {$0+$1})
            if sum < n { shots[10] = n - sum }
            
            if maxDiff < diff {
                maxDiff = diff
                maxResult = shots
            } else if maxDiff == diff {
                for i in stride(from: 10, to: -1, by: -1) {
                    if maxResult[i] < shots[i] {
                        maxResult = shots
                    } else if maxResult[i] == shots[i] {
                        continue
                    } else { break }
                }
            }
            return
        } else if count > n { return }
        
        for i in index..<11 {
            var shots = shots
            shots[i] = info[i] + 1
            dfs(count + shots[i], i, shots)
        }
    }
    
    dfs(0, 0, [0,0,0,0,0,0,0,0,0,0,0])
    return maxResult.reduce(0, {$0+$1}) == 0 ? [-1] : maxResult
}

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