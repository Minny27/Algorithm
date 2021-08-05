// 로봇 청소기
// 시간 : 2시간

import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var robot = readLine()!.split(separator: " ").map{Int(String($0))!}
var (i, j, d) = (robot[0], robot[1], robot[2])
var g = Array(repeating: Array(repeating: 0, count: m), count: n)
let di = [[-1, 0], [0, 1], [1, 0], [0, -1]]
var ans = 0
for i in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<m {
        g[i][j] = line[j]
    }
}

var cnt = 0 // 현재 위치 기준 인접한 칸 중 0이 아닌 칸 개수
while true {
    // 1
    if g[i][j] == 0 {
        g[i][j] = 2
        ans += 1
    }
    d = (d + 3) % 4 // 현재 방향에서 왼쪽 방향으로 바꾸기
    let ni = i + di[d][0]
    let nj = j + di[d][1]
    // 2 - a
    if g[ni][nj] == 0 {
        i = ni
        j = nj
        cnt = 0 // 이미 이동했기 떄문에 0
        continue
    }
    if g[ni][nj] != 0 {
        cnt += 1
        if cnt == 4 {
            cnt = 0 // 뒤로 가거나 종료할 것이기 때문에 0
            // 2 - b
            let tmpD = (d + 2) % 4
            let ni = i + di[tmpD][0]
            let nj = j + di[tmpD][1]
            // 2 - d
            if g[ni][nj] == 1 {
                print(ans)
                exit(0)
            }
            // 2 - c
            if g[ni][nj] != 1 {
                i = ni
                j = nj
            }
        }
    }
}
