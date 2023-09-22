// 콜라 문제
// 문제 유형: 구현
// 처음에는 재귀로 해야되나? 하다가 그리 복잡한 문제는 아니고 값 범위도 그랬음.
// 현재 빈병이고 빈병으로 만든 콜라가 다시 빈병이 되는 것을 더 빠르게 구현했으면 더 빨리 풀었을듯..

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var answer = 0
    
    var count = n
    while count >= a {
        answer += count / a * b
        count = count / a * b + count % a
    }
    
    return answer
}