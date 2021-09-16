// 추석 트래픽
// 시간: 2시간

import Foundation

func solution(_ lines:[String]) -> Int {
    var ans = 0
    var totalTaskTerm = [[Double]]()
    for line in lines {
        let data = line.components(separatedBy: " ")
        let time = data[1].components(separatedBy: ":")
        let completeTime = Double(data[data.count - 1].components(separatedBy: "s")[0])! * 1000
        var start: Double = 0
        var end: Double = 0
        
        for j in 0..<time.count {
            switch j {
            case 0:
                end += Double(time[j])! * 3600 * 1000
            case 1:
                end += Double(time[j])! * 60 * 1000
            case 2:
                end += Double(time[j])! * 1000
            default:
                break
            }
        }
        start = end - completeTime + 1
        totalTaskTerm.append([start, end])
    }
    
    for i in 0..<totalTaskTerm.count {
        var cnt = 1
        for j in i + 1..<totalTaskTerm.count {
            if totalTaskTerm[j][0] < totalTaskTerm[i][1] + 1000 {
                cnt += 1
            }
        }
        ans = ans < cnt ? cnt : ans
    }
    
    return ans
}