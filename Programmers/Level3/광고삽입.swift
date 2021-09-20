// 광고 삽입

import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    var ans = ""
    let totalPlayTime = timeToSecond(play_time)
    let totalAdvTime = timeToSecond(adv_time)
    var totalTime = Array(repeating: 0, count: totalPlayTime + 1)
    
    for log in logs {
        let timeArr = log.components(separatedBy: "-")
        let s = timeToSecond(timeArr[0])
        let e = timeToSecond(timeArr[1])
        totalTime[s] += 1
        totalTime[e] -= 1
    }
    
    for i in 1..<totalTime.count {
        totalTime[i] += totalTime[i - 1]
    }
    
    var s = 0
    var e = -1
    var maxSum = 0
    var subSum = 0
    var fastTime = 0
    while true {
        e += 1
        
        if e > totalPlayTime {
            break
        }
        
        subSum += totalTime[e]
        
        if e - s + 1 == totalAdvTime {
            if maxSum < subSum {
                maxSum = subSum
                fastTime = s
            }
            subSum -= totalTime[s]
            s += 1
        }
    }
    
    ans = secondToTime(fastTime)
    
    return ans
}

func timeToSecond(_ time: String) -> Int {
    let timeArr = time.components(separatedBy: ":").map { Int($0)! }
    let second = timeArr[0] * 3600 + timeArr[1] * 60 + timeArr[2]
    return second
}

func secondToTime(_ second: Int) -> String {
    let h = second / 3600 < 10 ? "0\(second / 3600)" : "\(second / 3600)"
    let m = second % 3600 / 60 < 10 ? "0\(second % 3600 / 60)" : "\(second % 3600 / 60)"
    let s = second % 3600 % 60 < 10 ? "0\(second % 3600 % 60)" : "\(second % 3600 % 60)"
    return "\(h):\(m):\(s)"
}