// n 번째 원소까지
// 느낀점: prefix가 있었군..

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    return num_list.dropLast(num_list.count - n)
}

// 다른 사람 풀이
// func solution(_ numList: [Int], _ n: Int) -> [Int] { 
//     Array(numList.prefix(n)) 
// }

// func solution(_ num_list:[Int], _ n:Int) -> [Int] {
//     return Array(num_list[...(n-1)])
// }
