// A->B
// 문제 유형: 1. 그리디 2. BFS
// 느낀점: BFS로 모든 경우의 수를 체크하는 방식으로 구현했는데, 그리디로 풀지는 않았음.
// 그리디로 어떻게 풀 수 있을 지 봤는데 끝 값에서 시작하는 방식이 있다는 것을 참고함
// 풀이 방법: b에서 시작해서 두 가지 경우의 수 ((값 - 1) / 10), (값 / 2) 중 전자가 더 빠르기 때문에
// 전자가 되면 전자를 선택 안되면 후자를 실행해서 a까지 도달
// 여기서 2로 나누어 떨어져야 2로 나누고 그 이외는 break를 설정해야함

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = input[0]
var b = input[1]
var answer = 1

while a < b {
    if b % 10 == 1 { b = (b-1) / 10 } // b에 1 빼고 10으로 나눈 나머지가 0이면 b = (b-1) / 10
    else if b % 2 == 0 { b /= 2 } // b가 2로 나누어 떨어지면 b를 2로 나누기
    else { break } // 위 두 경우의 수를 탈 수 없는 경우는 break
    answer += 1
}

print(a == b ? answer : -1)


// 이전 풀이
// let input = readLine()!.split(separator: " ").map { Int(String($0))! }
// let (a, b) = (input[0], input[1])

// func bfs() -> Int {
//     var q = [[a,0]]
    
//     while !q.isEmpty {
//         let f = q.removeFirst()
//         let (v,c) = (f[0],f[1])
        
//         if v == b {
//             return c
//         }
        
//         for k in [v*2, v*10+1] {
//             if k <= b {
//                 q.append([k, c+1])
//             }
//         }
//     }
//     return -1
// }

// print(bfs())

