// 둘만의 암호
// 문제 유형: 문자열
// 느낀점: "abcdefghijklmnopqrstuvwxyz" 여기서 지워나간다는 아이디어를 생각하지 못해서
// 시간을 엄청 많이 소비함... contains효율적으로 하기위해서 set을 생각하고
// char를 int로 int에서 char로 변환하는 것을 생각하다보니 너무 멀리 간 느낌이 있었다..
// 쉽지 않네...

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var answer = ""
    let sArray = Array(s).map { String($0) }
    let skipArray = Array(skip).map { String($0) }
    var alphas = Array("abcdefghijklmnopqrstuvwxyz").map { String($0) }
    
    for str in skipArray {
        for i in 0..<alphas.count {
            if alphas[i] == str {
                alphas.remove(at: i)
                break
            }
        }
    }
    
    for str in sArray {
        for i in 0..<alphas.count {
            if alphas[i] == str {
                answer += alphas[(i + index) % alphas.count]
                break
            }
        }
    }
    
    return answer
}
