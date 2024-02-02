// 행렬의 곱셈
// 문제 유형: 수학
// 느낀점: 행렬 곱셈의 원리를 잊고 있었다..
// 풀이 방법: 첫 번째 배열의 열과 두 번째 배열의 행의 길이가 일치하여야 하고 
// 첫 번째 배열의 행 x 두 번째 배열의 열로 결과값이 생성된다는 것을 이용
// 첫 번째 배열의 각 행을 기준으로 두 번째 배열을 반복함
// 이 과정에서 첫 번째 배열의 아이템 길이만큼 두 번째 배열의 열과 곱셈연산 합산
// 합산한 값들을 하나의 행으로 쌓고 answer에 append 

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer = [[Int]]()
    
    for i in 0..<arr1.count {
        var sum = Array(repeating: 0, count: arr2[0].count)
        for j in 0..<arr2[0].count {
            for k in 0..<arr1[0].count {
                sum[j] += arr1[i][k] * arr2[k][j]
            }      
        }
        answer.append(sum)
    }
    
    return answer
}