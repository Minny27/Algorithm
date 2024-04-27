// 소수 찾기
// 문제 유형: 완전 탐색
// 느낀 점: 처음에 7자리까지의 완전탐색을 구현하면 시간 초과가 날 것이라고 생각해서 좀 고민했었음.
// 또한, 0, 1에 대한 예외처리를 하지 않았던 것도 문제가 있었음.
// 풀이 방법: 전형적인 순열을 풀이하는 방식
// 1. prime number를 확인하는 함수 구현
// 2. numbers의 각각의 길이에 해당하는 소수를 구하기 위해 순회
// 3. 순회할 때 dfs 함수에 total에 길이를 넣고 호출
// 4. 순열로 찾다가 원하는 길이가 되면 그 문자열을 합한 정수를 판별 후, set으로 리턴(중복 제거를 위함)
// 5. 리턴된 모든 set을 저장하여 리턴
// 6. 2~5 반복
// 7. primeSet 길이 출력

import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map { String($0) }
    var visited = [Bool]()
    var primeSet: Set<Int> = []
    
    func dfs(_ total: Int, _ sub: [String]) -> Set<Int> {
        if total == sub.count {
            let n = Int(sub.joined()) ?? 0
            return isPrime(n) ? Set<Int>([n]): Set<Int>([])
        }
        
        var primeSet: Set<Int> = []
                
        for i in 0..<numbers.count {
            if !visited[i] { 
                visited[i] = true 
                
                var newSub = sub
                newSub.append(numbers[i])
                primeSet = primeSet.union(dfs(total, newSub))
                
                visited[i] = false
            }
        }
        return primeSet
    }
    
    
    for i in 1...numbers.count {
        visited = Array(repeating: false, count: numbers.count)
        
        primeSet = primeSet.union(dfs(i, []))
    }
    
    return primeSet.count
}

func isPrime(_ n: Int) -> Bool {
    guard n > 1 else { return false }
    for i in 2..<Int(sqrt(Double(n)))+1 {
        if n % i == 0 { return false }
    }
    return true
}

// 이전 풀이

// import Foundation

// func solution(_ numbers:String) -> Int {
//     let numbers = numbers.map { String($0) }
//     var visited = [Bool]()
//     var primeSet: Set<Int> = []
    
//     func dfs(_ total: Int, _ sub: [String]) {
//         if total == sub.count {
//             let n = Int(sub.joined()) ?? 0
//             if isPrime(n) { primeSet.insert(n) }
//             return
//         }
                
//         for i in 0..<numbers.count {
//             if !visited[i] { 
//                 visited[i] = true
                
//                 var newSub = sub
//                 newSub.append(numbers[i])
//                 dfs(total, newSub)
                
//                 visited[i] = false
//             }
//         }
//     }
    
    
//     for i in 1...numbers.count {
//         visited = Array(repeating: false, count: numbers.count)
        
//         dfs(i, [])
//     }
    
//     return primeSet.count
// }

// func isPrime(_ n: Int) -> Bool {
//     if n == 0 || n == 1 { return false }
//     for i in 2..<Int(sqrt(Double(n)))+1 {
//         if n % i == 0 { return false }
//     }
//     return true
// }