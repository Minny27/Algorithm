// 테이블 해시 함수
// 문제 유형: 수학, 구현
// 정렬을 하고 합까지 구하는 로직을 한 번에 map으로 처리했을 때 시간초과 발생
// xor 연산자를 까먹고 있었네.. ㅎㅎㅎ

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let data = data.sorted { ($0[col-1], $1[0]) < ($1[col-1], $0[0]) }
    var answer = 0
    
    for i in row_begin-1...row_end-1 {
        answer ^= data[i].map { $0 % (i+1) }.reduce(0, +)
    }
    return answer
}

// 시간 초과 코드
// func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
//   let sumData = data.sorted { ($0[col-1], $1[0]) < ($1[col], $0[0]) }.enumerated().map { i, v in
//         v.map { $0 % (i + 1) }.reduce(0, +)
//     }
//     var answer = 0
//     for i in row_begin-1...row_end-1 {
//         answer = answer ^ sumData[i]
//     }

//     return answer
// }