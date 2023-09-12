// 두 큐 합 같게 만들기
// 문제 유형: dequeue, 투 포인터
// 이 문제를.. 처음에 dfs로 풀려고 했던 나를 다시 돌아본다..
// 꺼내는 큐에서는 앞에서 꺼내고 append하는 큐에서는 뒤에서 넣는 다는 것을 늦게 알았음..
// 문제를 꼼꼼히, 예시도 하나하나 곱씹고 설계 후 개발하자...
// 이전 코드에서는 insert, append를 사용했었음. 그래서 시간초과가 발생해서 다른 코드를 참고하게 됨.
// 이 문제를 투 포인터로 푼다는 생각 자체를 못했음..
// 확실히 숙련도가 더 필요한 거 같다..
// sum에 두 큐를 합치고 queue1의 합을 저장
// mid에는 두 큐의 합의 2를 나눈 값을 저장
// 이렇게 하는 이유는 mid와 sum이 일치하면 답이 되고, sum이 mid를 초과하는 지 미만인지에 따라
// sum을 뺄 지 더할 지를 결정.
// 이게 가능한 이유는 빼는 곳과 넣는 곳이 일정하기 때문
// 그리고 mid를 기준으로 비교를 하기 때문에 답이 최단 거리가 됨

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var answer = 0
    var queue = queue1 + queue2
    var sum = queue1.reduce(0, {$0+$1})
    var mid = queue.reduce(0, {$0+$1}) / 2
    var s = 0
    var e = queue1.count
    
    // 두 큐의 정수 합이 int 범위를 넘으면 -1, 최대가 두 큐의 정수 합 이기때문
    if !(mid is Int) { return -1 }
        
    while s <= e && e < queue.count {
        // 두 큐의 원소 합이 mid일 때 최단 거리.
        if mid == sum {
            return answer
        }
        
        // mid보다 sum(q1)이 더 크면 s인덱스에 있는 값 빼기
        if mid < sum {
            sum -= queue[s]
            s += 1
        // mid보다 sum(q1)가 더 작으면 e인덱스에 있는 값 더하기
        } else if mid > sum {
            sum += queue[e]
            e += 1
        }
        answer += 1
    }
    return -1
}


// 이전 시간 초과 코드
// import Foundation

// func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
//     var answer = -1
//     var queue1 = queue1
//     var queue2 = queue2
//     var sum1 = queue1.reduce(0, {$0+$1})              
//     var sum2 = queue2.reduce(0, {$0+$1})
//     var count = 0
//     var limit = queue1.count * 4
    
//     while true {
//         if count == limit { break }
        
//         if sum1 > sum2 {
//             if queue1Reversed.isEmpty
//             let last = queue1.removeFirst()
//             queue2.append(last)
//             sum1 -= last
//             sum2 += last
//             count += 1
//             continue
//         }
        
//         if sum1 < sum2 {
//             let last = queue2.removeFirst()
//             queue1.append(last)
//             sum2 -= last
//             sum1 += last
//             count += 1
//             continue
//         }
        
//         if sum1 == sum2 {
//             answer = count
//             break
//         }
//     }
//     return answer
// }