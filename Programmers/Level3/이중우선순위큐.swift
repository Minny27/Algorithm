// 이중우선순위큐

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var ans = [Int]()
    
    for cmd in operations {
        let cmdArr = cmd.components(separatedBy: " ")
        if cmdArr[0] == "I" {
            ans.append(Int(cmdArr[1])!)
            ans.sort(by: >)
            continue
        }
        
        if cmdArr[1] == "1" {
            if ans.count >= 1 {
                ans.removeFirst()
            }
        }
        
        else {
            if ans.count >= 1 {
                ans.removeLast()
            }
        }
    }
    
    return ans.count == 0 ? [0,0] : [ans[0], ans[ans.count - 1]]
}