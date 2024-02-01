// n^2 배열 자르기
// 문제 유형: 수학
// 느낀점: 이런 문제를 실전에서 마주하면 규칙을 제대로 잘 찾을 수 있을지..
// 보자마자 / % 문제일 거라고 생각했지만, 규칙을 찾지는 못했다..
// 속도가 10초라고 생각해서 풀었을 때, 시간초과가 나는 것도 빠르게 캐치했으면 좋았을듯..
// 수학 문제는 많이 풀어보는 게 정답인듯...
// 규칙은 찾았으나, 너무 단순하게 생각한듯...
// 풀이 방법: n과 index사이에 몫과 나머지로 규칙이 생성됨
// 먼저, 각 군에 번째만큼 군의 숫자 개수가 정해진다는 것을 알 수 있음.
// 이 때, 몫과 나머지의 관계를 보면, 몫이 나머지보다 크거나 같으면 해당 군의 숫자로 채우면 된다는 것을 알 수 있음.
// 값을 추가할 때는 각각 몫 + 1, 나머지 + 1라는 것을 알 수있음.
// 몫(i / n), 나머지(i % n), 인덱스(i), 값
// 몫 0 0 0 0  1 1 1 1  2 2 2 2
// 나 0 1 2 3  0 1 2 3  0 1 2 3
// 인 0 1 2 3  4 5 6 7  8 9 10 11  
// 값 1 2 3 4  2 2 3 4  3 3 3 4   4 4 4 4 
import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var arr = [Int]()
    
    for i in Int(left)...Int(right) {
        let d = i / n
        let r = i % n
        
        if d >= r {
            arr.append(d+1)
        } else{
            arr.append(r+1)
        }
    }
    return arr
}

// 시간 초과 코드 2
// func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
//     var arr = [Int]()
//     var count = 0
    
//     func check(_ i: Int) -> Bool {
//         return left <= i && i <= right
//     }
    
//     for i in 1...n {
//         for _ in 0..<i {
//             if count > right { break }
//             if check(count) { arr.append(i) }
//             count += 1
//         }
        
//         for j in i+1..<n+1 {
//             if count > right { break }
//             if check(count) { arr.append(j) }
//             count += 1
//         }
//     }
//     return arr
// }

// 시간 초과 코드 1
// import Foundation

// func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
//     var arr = [Int]()
//     var count = 1.0
//     for i in 1...n {
//         for _ in 0..<i {
//             arr.append(i)
//         }
        
//         for j in i+1..<n+1 {
//             arr.append(j)
//         }
//     }
    
//     return Array(arr[Int(left)..<Int(right)+1])
// }