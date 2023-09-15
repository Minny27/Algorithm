// 가장 큰 수
// 문제 유형: 정렬
// 음.. 처음에 쉬워보여서 덤볐는데 쉽지 않았음..
// [30, 34 3] 이 부분에서 v1(큰값), v2(작은값)이 있을 때
// 작은 값을 기준으로 substring을 통해서 반복해서 크기를 비교해서
// 같은 값이 존재하면 contine, 작은 값의 substring이 더 크면 큰 값과 위치를 바꾸고
// 큰 값의 substring이 더 크면 그대로 위치를 유지
// 그 상태에서 큰값을 다시 작은 값의 길이부터 시작해서 반복해서 작은 값의 마지막값과 비교해서
// 작은 값의 마지막 인덱스 값보다 작으면 자리를 바꾸고 아니면 그대로 유지해서 return
// 퀵 소트안에서 이런 로직을 구현하다보니 값의 위치에 따라서 결과값이 달라짐...
// 퀵 소트 자체를 구현하는 문제인 것 같음..
// 다음에 다시 풀어봐야할 듯...

import Foundation

func solution(_ numbers:[Int]) -> String {
    return numbers.map ({ String($0) }).sorted { v1 , v2 in
        if v2 < v1 {
            if v2.count < v1.count {
                let v1Arr = v1.map { String($0) }
                let v2Arr = v2.map { String($0) }
                for i in 0..<v2.count {
                    if v2Arr[i] < v1Arr[i] { return true }
                    else if v2Arr[i] > v1Arr[i] { return false }
                }
                for i in v2.count..<v1.count {
                    if v2Arr[v2.count - 1] < v1Arr[i] { return true }
                    else if v2Arr[v2.count - 1] > v1Arr[i] { return false }
                }
                return true
            } else { return true }
        } else {
            return false
        }
    }.joined()
}