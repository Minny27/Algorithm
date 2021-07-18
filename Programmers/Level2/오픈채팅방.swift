// 오픈채팅방
// 시간 : 30분

import Foundation

func solution(_ record:[String]) -> [String] {
    var ans = [String]()
    var ht = [String : String]() // [유저 아이디 : 닉네임]
    
    for str in record {
        let line = str.s짝지어 제거하기plit(separator: " ").map{String($0)}
        // Enter, Change 일 때만 닉네임을 갱신하므로 그 외의 경우는 넘어가기
        if line[0] != "Enter" && line[0] != "Change" {
            continue
        }
        ht[line[1]] = line[2] // 닉네임 갱신
    }

    for str in record {
        let line = str.split(separator: " ").map{String($0)}
        if line[0] == "Enter" {
            ans.append("\(ht[line[1]]!)님이 들어왔습니다.")
            continue
        }
        if line[0] == "Leave" {
            ans.append("\(ht[line[1]]!)님이 나갔습니다.")
            continue
        }
    }
    return ans
}
print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))