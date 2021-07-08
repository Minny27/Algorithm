// 로또의 최고 순위와 최저 순위
// 시간 : 15분

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var ans = [Int]()
    var g : [[Int]] = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var k = 1
    for i in 0..<rows {
        for j in 0..<columns {
            g[i][j] = k
            k += 1
        }
    }
    
    func rotate(_ r1:Int, _ c1:Int, _ r2:Int, _ c2:Int) -> Int {
        var tmp = g[r1 - 1][c1 - 1]
        var minValue = tmp
        var (i, j) = (r1 - 1, c1 - 1)
        //오른쪽
        for j in c1..<c2{ // 2 4
            minValue = min(minValue, g[i][j])
            (tmp, g[i][j]) = (g[i][j], tmp)
        }
        j = c2 - 1

        //아래
        for i in r1..<r2{ // 2 5
            minValue = min(minValue, g[i][j])
            (tmp, g[i][j]) = (g[i][j], tmp)
        }
        i = r2 - 1
        
        //왼쪽
        for j in stride(from: c2 - 2, to: c1 - 2, by: -1) {
            minValue = min(minValue, g[i][j])
            (tmp, g[i][j]) = (g[i][j], tmp)
        }
        j = c1 - 1

        //위
        for i in stride(from: r2 - 2, to: r1 - 2, by: -1) {
            minValue = min(minValue, g[i][j])
            (tmp, g[i][j]) = (g[i][j], tmp)
        }
        

        return minValue
    }
    for matrix in queries {
        ans.append(rotate(matrix[0], matrix[1], matrix[2], matrix[3]))
    }
    return ans
}

print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
print(solution(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]))
print(solution(100, 97, [[1,1,100,97]]))
