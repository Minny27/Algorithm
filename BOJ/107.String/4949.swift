// 균형잡힌 세상
// 문제 유형: 문자열
// 풀이 시간: 20분
// 느낀점: 그리디, 문자열 문제를 많이 풀어 봐야할 듯.
// 풀이 방법: "[" 또는 "("이 나오면 q에 넣기
// "]" 또는 ")"이 나오면 큐의 마지막 값이 반대 값인지 확인하고
// 맞으면 remove 아니면 그 값을 queue에 넣고 break
// queue가 비어 있으면 yes, 아니면 no
// 처음에 풀 때는 반대 값이 안 나왔을 때, flag를 만들어서 true를 넣고 종료하는 방식으로 구현했었는데,
// queue에 오른쪽 괄호를 넣고 처리하는 것이 더 깔끔하다는 것을 알았음.

var s = ""

while true {
    let line = String(readLine()!)
    
    if line.first == Character(".") { break }
    
    var q = [Character]()
    
    while true {
        if c == Character("[") || c == Character("(") {
            q.append(c)
            continue
        }
        
        if c == Character("]") {
            if q.last != "[" {
                q.append(c)
                break
            } else {
                q.removeLast()
                continue
            }
        }
        
        
        if c == Character(")") {
            if q.last != "(" {
                q.append(c)
                break
            } else {
                q.removeLast()
                continue
            }
        }
    }
    
    s += q.isEmpty ? "yes\n" : "no\n"
}

print(s)

// 이전 풀이
// var s = ""

// while true {
//     let line = String(readLine()!)
    
//     if let v = line.first, v == Character(".") { break }
    
//     var flag = false
//     var queue = [Character]()
    
//     for c in line {
//         if c == Character("[") || c == Character("(") {
//             queue.append(c)
//             continue
//         }
        
//         if c == Character("]") {
//             if queue.isEmpty || queue.last != "[" {
//                 flag = true
//                 s += "no\n"
//                 break
//             }
//             if queue.last == "[" { queue.removeLast() }
//             continue
//         }
        
        
//         if c == Character(")") {
//             if queue.isEmpty || queue.last != "(" {
//                 flag = true
//                 s += "no\n"
//                 break
//             }
//             if queue.last == "(" { queue.removeLast() }
//             continue
//         }
//     }
    
//     if flag { continue }
//     s += queue.isEmpty ? "yes\n" : "no\n"
// }

// print(s)
