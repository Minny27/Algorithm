// 튜플
// 문제 유형: 문자열, 딕셔너리
// 느낀점: 튜플의 원소가 중복이 가능하다고 해서 좀 고민했었음.
// 또한, 슬라이싱을 "},{"로 할 수 있다는 것을 배움.. 처음에 굉장히 복잡하게 했던 거 같음..
// 그리고 split함수를 많이 사용했었는데, 파라미터가 character 타입이라 문자열로 구분하기 위해서는
// components() 함수를 사용해야된다는 것을 알게됨.
// 풀이 방법: 먼저 앞, 뒤 끝에 "{{}", "}}"을 미리 제거 후 "},{"로 원소 나누기 또한, 그 원소마다는 ","로 나누기
// 그리고 개수를 기준으로 오름차순 정렬. 그 이유는 튜플안의 원소들은 순서가 상관없기 때문에,
// 길이가 작은 튜플부터 시작해서 이미 나왔던 값이 몇개인지를 리턴받고 그 값을 빼가면서 답을 쌓아나가기 위함.
// 아이템을 반복할 때마다 dictCopy에 dict를 할당하고, dictCopy에 값이 있으면서 0보다 크면 줄이고
// 그 이외에는 answer에 해당 값을 추가하고, dict에도 해당 키 값을 더해줌


// 다른 답안 참고 풀이
import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    s.removeLast(2)
    s.removeFirst(2)
    
    var dict = [Int: Int]()
    var dictCopy = [Int: Int]()
    let arr = s.components(separatedBy: "},{").map { $0.split(separator: ",") }.sorted(by: { $0.count < $1.count })
    var answer = [Int]()
    
    for s in arr {
        dictCopy = dict
        for n in s {
            let n = Int(String(n)) ?? 0
            if let v = dictCopy[n], v > 0 {
                dictCopy[n]! -= 1
            } else { 
                answer.append(n)
                dict[n, default: 0] += 1
            }
        }
    }
    return answer
}

// 이전 풀이
// import Foundation

// func solution(_ s:String) -> [Int] {
//     var s = s
//     s.removeLast(2)
//     s.removeFirst(2)
    
//     var dict = [Int: Int]()
//     var dictCopy = [Int: Int]()
//     let arr = s.components(separatedBy: "},{").map { $0.split(separator: ",") }.sorted(by: { $0.count < $1.count })
//     var answer = [Int]()
    
//     for s in arr {
//         dictCopy = dict
//         for n in s {
//             let n = Int(String(n)) ?? 0
//             if let v = dictCopy[n], v > 0 {
//                 dictCopy[n]! -= 1
//             } else { 
//                 answer.append(n)
//                 dict[n, default: 0] += 1
//             }
//         }
//     }
//     return answer
// }