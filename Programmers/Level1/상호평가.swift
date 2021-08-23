// 상호평가

import Foundation

func solution(_ scores:[[Int]]) -> String {
    var ans = ""
    
    for j in 0..<scores.count {
        var stuScore = [Int]()
        
        for i in 0..<scores.count {
            stuScore.append(scores[i][j])
        }
        let minValue = stuScore.min()
        let maxValue = stuScore.max()
        var boundaryCnt = 0
        var sum = stuScore.reduce(0, +) 
        var cnt = scores.count
        
        if stuScore[j] == maxValue || stuScore[j] == minValue {
            for i in 0..<scores.count {
                if stuScore[j] == stuScore[i]{
                    boundaryCnt += 1
                }
            }
            if boundaryCnt < 2 {
                sum -= stuScore[j]
                cnt -= 1
            }
        }
    
        let avg = sum / cnt
        switch avg {
        case 90...:
            ans += "A"
        case 80..<90:
            ans += "B"
        case 70..<80:
            ans += "C"
        case 50..<70:
            ans += "D"
        default:
            ans += "F"
        }
    }
    return ans
}

print(solution([[100,90,98,88,65],[50,45,99,85,77],[47,88,95,80,67],[61,57,100,80,65],[24,90,94,75,65]]    )) // FBABD
print(solution([[50,90],[50,87]]    )) // DA
print(solution([[70,49,90],[68,50,38],[73,31,100]]    ))// CFD
print(solution([[100,60], [1,100]])) // FD
print(solution([[90, 90, 90], [50, 50, 49], [80, 80, 79]])) // DBC