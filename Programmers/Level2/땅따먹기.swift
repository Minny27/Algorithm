// 땅따먹기
// 문제 유형: DP
// 느낀점: 왜 DP라고 생각하고 DP로 풀지 않았을까..
// set으로 풀려고 하다가 시간을 너무 잡아먹었음..
// 이전에 현대 오토에버 코테랑 비슷했음..
// 풀이 방법: 연속된 행은 밟지 않는다고 했기 때문에 이전 행에서 같지 않은 열의 최대값을 더해주면 됨.


import Foundation

func solution(_ land:[[Int]]) -> Int{
    var land = land
    
    for i in 1..<land.count {
        land[i][0] += max(land[i-1][1], land[i-1][2], land[i-1][3])
        land[i][1] += max(land[i-1][0], land[i-1][2], land[i-1][3])
        land[i][2] += max(land[i-1][0], land[i-1][1], land[i-1][3])
        land[i][3] += max(land[i-1][0], land[i-1][1], land[i-1][2])
    }
    
    return land[land.count-1].max() ?? 0
}

// 이전 풀이
// import Foundation

// func solution(_ land:[[Int]]) -> Int{
//     var land = land
    
//     for i in 1..<land.count {
//         for j in 0..<4 {
//             var maxValue = 0
//             for k in 0..<4 {
//                 if j == k { continue }
//                 maxValue = max(maxValue, land[i-1][k])
//             }
//             land[i][j] += maxValue
//         }
//     }
    
//     return land[land.count-1].max() ?? 0
// }
