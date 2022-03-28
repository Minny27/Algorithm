// 신고 결과 받기

import Foundation

typealias BanData = (
    requestList: Set<String>, // 밴 요청 리스트
    banCount: Int, // 밴당한 횟수
    messageCount: Int // 메시지 받은 횟수
)

var userBanData = [String: BanData]()

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    Solution.userBanData = dataUpdate(id_list, report)    
    return calcMessageCount(id_list, k)
}

func dataUpdate(_ id_list:[String], _ report:[String]) -> [String: BanData] {
    var banData = [String: BanData]()
    
    for user in id_list {
        banData[user] = BanData([], 0, 0)
    }
    
    for data in report {
        let stringArray = data.split(separator: " ").map { String($0) }
        let (start, end) = (stringArray[0], stringArray[1])
        
        if !banData[start]!.requestList.contains(end) {
            banData[start]!.requestList.insert(end)
            banData[end]!.banCount += 1
        }
    }
    return banData
}

func calcMessageCount(_ id_list:[String], _ k: Int) -> [Int] {
    var banCountList = [Int]()
    for user in id_list {
        for banUser in Solution.userBanData[user]!.requestList {
            if Solution.userBanData[banUser]!.banCount >= k {
                Solution.userBanData[user]!.messageCount += 1
            }
        }
        banCountList.append(Solution.userBanData[user]!.messageCount)
    }
    return banCountList
}