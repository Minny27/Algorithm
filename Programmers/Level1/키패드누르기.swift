// 키패드누르기
// 시간 : 2시간

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var ans = ""
    let l = [1 : (0, 0), 4 : (1, 0), 7 : (2, 0)] // 왼쪽 키패드 좌표
    let m = [2 : (0, 1), 5 : (1, 1), 8 : (2, 1), 0 : (3, 1)] // 중앙 키패드 좌표
    let r = [3 : (0, 2), 6 : (1, 2), 9 : (2, 2)] // 오른쪽 키패드 좌표
    var lf = (3, 0) // 왼손 엄지 손가락 위치
    var rf = (3, 2) // 오른손 엄지 손가락 위치
    
    for number in numbers {
        // 왼쪽 키패드일 떄
        if let matrix = l[number] {
            ans += "L"
            lf = matrix // 왼손 좌표 옮기기
        }
        // 오른쪽 키패드일 떄
        else if let matrix = r[number] {
            ans += "R"
            rf = matrix // 오른손 좌표 옮기기
        }
        // 중앙 키패드일 떄
        else {
            let matrix = m[number]!
            let l_dist = abs((matrix.0 - lf.0)) + abs(matrix.1 - lf.1)
            let r_dist = abs((matrix.0 - rf.0)) + abs(matrix.1 - rf.1)
            
            // 중앙 패드에서 왼손이 더 가까울 때
            if l_dist < r_dist {
                ans += "L"
                lf = matrix
            }
            
            // 중앙 패드에서 오른손이 더 가까울 때
            else if l_dist > r_dist {
                ans += "R"
                rf = matrix
            }
            
            // 중앙 패드에서 왼손, 오른손 거리가 같을 경우
            else {
                if hand == "left" {
                    ans += "L"
                    lf = matrix
                }
                else {
                    ans += "R"
                    rf = matrix
                }
            }
        }
    }
    return ans
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
//print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
//print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right"))