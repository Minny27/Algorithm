// 이모티콘 할인행사
// 문제 유형: dfs, back tracking
// 음.. 사실 dfs로 수월하게 할 수 있을 줄 알았지만,,, 경우의 수 문제는 아직 많이 풀어봐야 할 듯함..
// 일단 이 문제는 할인율(10,20,30,40) 4개를 중복을 허용하고 순서를 고려해서 이모티콘의 수만큼 꺼내는 중복순열 개념임
// 잘 모르겠어서 다른 사람들의 아이디어를 차용함.
// index를 왜 파라미터로 전달해야하는지 이해못했었는데, index가 뽑는 아이템의 개수라고 생각하면 됨
// 그러니까 current에 할인율을 이모티콘의 수만큼 추가했을 때, 작업을 수행하고 Return
// 나중에 다시 한 번 풀어봐야할듯..?


import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var (maxPerson, maxPrice) = (0, 0) // 최종 결과 값
    
    func dfs(_ index: Int, _ current: [Int]) {
        // 할인율의 개수가 이모티콘의 개수와 동일할 때, 구하고자하는 로직 구현
        if index == emoticons.count {
            var person = 0 // 특정 할인율에서의 가입 인원수
            var price = 0 // 특정 할인율에서의 모든 유저의 구매 금액
            
            for user in users {
                var subSum = 0 // 유저가 구매 금액
                for i in 0..<current.count {
                    if user[0] > current[i] { continue }
                    subSum += Int(Double(emoticons[i] * 100 - current[i]) * 0.01)
                }
                // 유저가 설정한 금액 이상이면 이모티콘 플러스 서비스에 가입
                // 이상인지 모르고.. 시간씀.. 글을 잘 읽자!
                if user[1] <= subSum {
                    person += 1
                }
                // 유저가 설정한 금액 미만이면 price에 현재 유저의 금액 추가
                else {
                    price += subSum
                }
            }
            // 이 문제의 함정을 추가한 지점임
            // maxPerson보다 크면 가입 유저수를 갱신
            // price도 갱신 -> 가입 유저수가 우선이기 때문
            if maxPerson < person {
                maxPerson = person
                maxPrice = price
            }
            // 유저 가입수가 동일한 경우에는 지출 금액이 가장 높은 경우로 갱신
            else if maxPerson == person {
                maxPrice = max(maxPrice, price)
            }
            return
        }
        
        // 중복 순열을 만들기 위한 dfs -> 컬렉션의 모든 아이템을 반복(순서 고려) + 방문 여부 체크 안 함(중복 O)
        for discount in [10,20,30,40] {
            dfs(index + 1, current + [discount])
        }
    }
    
    dfs(0, [])
    return [maxPerson, maxPrice]
}

print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
