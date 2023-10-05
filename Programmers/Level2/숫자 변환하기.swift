// 숫자 변환하기
// 문제 유형: 딕셔너리, Set
// 아 이문제를... dfs, bfs로 둘 다 시간 초과가 발생
// 최단 거리를 구하는 문제라고 인지를 빠르게 못함..
// 그리고 bfs의 visited를 set으로 구성하면 해결하 수 있을 줄 알았으나..
// 테스트 케이스 9, 10에서 시간 초과 발생..
// 그래서 참고를 함..
// queue 자체를 set으로 구성하고 depth를 순회하면서
// 새로운 depth(next)로 현재 queue를 갱신하는 방식으로 문제를 해결할 수 있었음.
// 아 참 아이디어가 어렵다..

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var queue: Set<[Int]> = [[x,0]]

    while !queue.isEmpty {
        var next = Set<[Int]>()

        for q in queue {
            let (v, c) = (q[0],q[1])

            if v == y { return c }

            if v + n <= y { next.insert([v + n, c + 1]) }
            if v * 2 <= y { next.insert([v * 2, c + 1]) }
            if v * 3 <= y { next.insert([v * 3, c + 1]) }
        }
        queue = next
    }
    return -1
}

// bfs 테스트 케이스 9, 10 시간 초과
// func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
//     var answer = -1
//     var queue = [[x,0]]
//     var visited = Set<Int>()
    
//     while !queue.isEmpty {
//         let q = queue.removeFirst()
//         let (v,c) = (q[0], q[1])
        
//         if v == y { answer = c; break }
        
//         if v > y { continue }
        
//         if !visited.contains(v) {
//             visited.insert(v)
            
//             if v * 3 <= y && !visited.contains(v*3)  { queue.append([v * 3, c + 1]) }
//             if v * 2 <= y && !visited.contains(v*2)  { queue.append([v * 2, c + 1]) }
//             if v + n <= y && !visited.contains(v+n)  { queue.append([v + n, c + 1]) }
//         }
//     }
    
//     return answer
// }

// 이전 dfs 풀이 -> 시간 초과
// func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
//     var answer = -1
    
//     func dfs(_ num: Int, _ count: Int) {
//         if num == y {
//             answer = answer == -1 ? count : min(answer, count)
//             return
//         }
        
//         if num > y || count >= 14 {
//             return
//         }
        
//         dfs(num * 3, count + 1)
//         dfs(num * 2, count + 1)
//         dfs(num + n, count + 1)
//     }
//     dfs(x, 0)
//     return answer
// }