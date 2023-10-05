// 귤 고르기
// 문제 유형: 딕셔너리, 구현
// 이 문제를 한 줄 코딩으로 구현이 가능했다니.. 감탄스러웠습니다.
// dict에 값을 += 할 때 default를 잘 활용하자..

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict = [Int: Int]()
    var answer = 0
    
    for t in tangerine {
        dict[t, default: 0] += 1
    }
    
    var count = k
    for v in dict.values.sorted(by: >) {
        count -= v
        answer += 1
        if count <= 0 { break }
    }
    
    return answer
}