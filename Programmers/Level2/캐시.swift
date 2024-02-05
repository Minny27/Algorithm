// 캐시
// 문제 유형: Stack, LRU(Least Recently Used)
// 느낀점: LRU의 개념을 알고 풀었어야했다.. 또한, 조건을 어떤 것을 먼저 줄지도 고민하느라 시간이 많이갔음.
// 풀이 방법: 처음에는 현재 캐시가 cacheSize보다 작은 경우, 캐시에서 도시가 있는지 확인하는 방식으로 구현했었는데,
// 이렇게 하게되면 현재 캐시가 cacheSize보다 크거나 같은 경우, 작은 경우 둘 다 시티를 찾아서 지우고 append하는
// 작업을 두 번 써줘야하기 때문에 비효율적.
// 그래서 현재 캐시에 도시가 있는 경우, 지우고 append하고 anwer += 1하고
// 없을 때는 캐시 크기가 사이즈보다 크거나 같으면 removeFirst() 후, append하는 방식으로 구현

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cities = cities.map { $0.lowercased() }
    var arr = [String]()
    var answer = 0
    
    for c in cities {
        if cacheSize == 0 { return cities.count * 5 }
        if let index = arr.firstIndex(of: c) {
            arr.remove(at: index)
            arr.append(c)
            answer += 1
        } else {
            if arr.count >= cacheSize {
                arr.removeFirst()
            }
            arr.append(c)
            answer += 5
        }
    }
    
    return answer
}