// 보석 쇼핑
// 시간 : 4시간

import Foundation

func solution(_ gems:[String]) -> [Int] {
    var ans = [Int]()
    let gemsLen = Set(gems).count // 중복을 제거한 모든 보석 개수
    var gemsHt = [String : Int]() // [보석명 : 개수] 저장하는 해시 테이블
    var l = 0
    var r = -1
    var minValue = 100000 // 가장 짧은 구간 길이
    
    while l < gems.count && r < gems.count {
        let gemCnt = gemsHt.count
        // 모든 보석을 아직 찾지 못했을 때, r위치에 있는 보석 개수 + 1
        if gemCnt != gemsLen {
            r += 1
            // 전체 배열 범위를 넘었을 때 끝내기
            if r == gems.count {
                break
            }
            if let tmp = gemsHt[gems[r]] {
                gemsHt[gems[r]]! = tmp + 1
            }
            // 보석이 없으면 추가하기
            else {
                gemsHt[gems[r]] = 1
            }
        }
        
        // 모든 보석을 찾았을 때, l위치에 있는 보석 개수 - 1
        else if gemCnt == gemsLen {
            // 가장 짧은 구간의 경우 구간길이를 갱신하고 구간의 [처음, 끝]을 ans에 저장
            if minValue > r - l {
                minValue = r - l
                ans = [l + 1, r + 1]
            }
            if let tmp = gemsHt[gems[l]] {
                // 현재 보석 개수가 1개라면 지우기
                if tmp == 1 {
                    gemsHt.removeValue(forKey: gems[l])
                }
                else {
                    gemsHt[gems[l]]! -= 1
                }
            }
            l += 1
        }
    }
    return ans
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"]))
print(solution(["A", "B", "B", "C", "C", "B", "A"]))
