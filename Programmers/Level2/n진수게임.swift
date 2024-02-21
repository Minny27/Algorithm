// n진수 게임
// 문제 유형: 수학
// 느낀점: 문제가 이해 안 되서 시간 쓴 것과 확실한 규칙을 찾지 못했던 게 아쉬웠음..
// 풀이방법: 계산해 될 최대 개수가 t*m개로 이루어진 것, 답의 길이는 t
// 0부터 t * m - 1까지 값을 n진수의 문자열을 arr로 리턴받아서 sArr를 구성
// sArr를 반복하면서 내가 외칠 번째수 index+1 % m == p % m
// 또한, 외쳐야하는 특정 번 째 수를 구하는 식을 좀 오래 생각했던 거 같음.
// 속도는 아래 것이 더 빠름
// stride로 했으면 더 효율적이었을듯..

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var sArr = [String]()
    var answer = ""
    
    for i in 0..<t*m {
        sArr += String(i, radix: n).map { String($0.uppercased()) }
    }
    
    for (i, v) in sArr.enumerated() {
        if (i + 1) % m == p % m {
            answer += v
            
            if answer.count == t {
                break
            }
        }
    }
    return answer
}

// 이전 풀이
// func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
//     var s = ""
//     var answer = ""
    
//     var i = 0
//     var count = 0
//     while answer.count < t {
//         let sArr = String(i, radix: n).map { $0.uppercased() }
        
//         for j in 0..<sArr.count {
//             if (count + j + 1) % m == p % m {
//                 answer += sArr[j]
                
//                 if answer.count == t {
//                     break
//                 }
//             }
//         }
//         i += 1
//         count += sArr.count
//     }
    
//     return answer
// }