// 연속 부분 수열 합의 개수
// 문제 유형: DP
// 아... DP는 확실히 숙련도가 없는듯하다..
// 문제를 풀이하는데 너무 오래 걸렸음..
// 처음에 dfs로 조합으로 하려고 했는데,, 잘 안 되서
// 3중 for문으로 구하려고했는데 9, 10 테스트케이스 시간초과발생..
// 그래서 생각해보니까 연속부분합이기때문에 반복되는 합이 있어서 dp로 해결

// 풀이 설명
// 7 9 1 1 4
// d0 = 0 0 0 0 0
// d1 = 7 9 1 1 4
// d2 = 16 10 2 5 11
// d3 = 

// 위를 보아 다음의 점화식이 생성됨
// i: 개수, j: 인덱스
// d[i][j] = d[i-1][j] + elements[(j+i) % elements.count]

func solution(_ elements:[Int]) -> Int {
    var answer: Set<Int> = []
    let l = elements.count
    var dp = Array(repeating: Array(repeating: 0, count: l+1), count: l+1)
    
    for i in 1...l { // 합할 부분 수열 개수
        for j in 0..<l { // 인덱스
            let sum = dp[i - 1][j] + elements[(j+i) % l]
            dp[i][j] = sum
            answer.insert(sum)
        }
    }
    return answer.count
}

// 조합 이전 풀이 => 연속 부분합이라는 것을 간과
// import Foundation

// func solution(_ elements:[Int]) -> Int {
//     var answer: Set<Int> = []
    
//     func dfs(_ idx: Int, _ n: Int, _ c: Int, _ sum: Int) {
//         if n == c {
//             answer.insert(sum)
//             return
//         }
        
//         for i in idx..<elements.count {
//             dfs(i, n + 1, c, sum + elements[i])
//         }
//     }
    
//     for i in 1...elements.count {
//         dfs(0, 0, i, 0)   
//     }
//     return answer.count
// }