// 2023 KAKAO BLIND RECRUITMENT - 택배 배달과 수거하기
// 문제 유형: 그리디
// 느낀점: 이 문제가 완전 탐색이라고 생각해서 머리 아프게 고민함...
// 아직 많이 부족하다고 생각했고, 처음 실을 때도 최대치에서 1씩 작게 해야 된다고 생각함....
// n이 최대 100,000인 건만 보고도 이중 for문으로 안 된다는 것을 파악했어야했다..
// 항상 최대치의 택배를 태우고 끝에서부터 돌아온다는 생각이 중요했던 것 같다.
// 그래서 거리 x 2로 값을 구할 수 있기 때문.

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var answer = 0
    var delivery = 0
    var pickup = 0
    
    // 마지막 집에서부터 시작
    for i in stride(from: n - 1, to: -1, by: -1) {
        if deliveries[i] == 0 && pickups[i] == 0 { continue }
        
        // i번 째 집을 방문하는 횟수
        var count = 0
        
        // i번 째 집을 방문했을 때, 현재 줄 택배 혹은 가져갈 상자를 cap(최대치)만큼 더해주기
        while (deliveries[i] > delivery || pickups[i] > pickup) {
            delivery += cap
            pickup += cap
            count += 1
        }
        
        // i번 째 집을 방문하고 나서 남은 차액 남기기
        delivery -= deliveries[i]
        pickup -= pickups[i]
        
        // 왔다가기 때문에 거리 * 2
        answer += (i + 1) * count * 2
    }
    return Int64(answer)
}
