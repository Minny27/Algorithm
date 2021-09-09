import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var index = -1 // H-Index
    var ans = 0
        
    while index < citations.count {
        index += 1
        if index >= citations.count {
            return citations.count
        }
        
        if index >= citations[index] {
            ans = index
            break
        }
    }
    
    return ans
}