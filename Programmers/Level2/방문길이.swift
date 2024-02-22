// 방문길이
// 문제 유형: 기하학, 자료구조(Set)
// 느낀점: 처음에는 점과 방향을 set에 추가하는 방식으로 구현했었는데
// 점 간의 양방향 이동이 될 수 있다는 것을 고려하지 못함.
// 그래서 start, end 둘 다 set에 넣을 수 있는 구조체를 만들어야 겠다고 생각
// typealias는 Hashable을 준수하지 않는 다는 것을 알게 됨...
// 풀이 방법: CoordinatesSet에 특정 지점으로 이동할 때, start, end 좌표를 넣고
// cSet에 두 지점을 각각 시작, 끝 점으로 하는 set이 없으면 값을 넣고 cSet.count / 2리턴

import Foundation

struct Coordinates: Hashable {
    let x: Int
    let y: Int
}

struct CoordinatesSet: Hashable {
    let start: Coordinates
    let end: Coordinates
}

func solution(_ dirs:String) -> Int {
    var cSet: Set<CoordinatesSet> = []
    var d: [Character: [Int]] = ["U": [0,1],"D": [0,-1],"L": [-1,0],"R": [1,0]]
    var start = Coordinates(x: 0, y: 0)
    
    for dir in dirs {
        guard let v = d[dir] else { break }
        let (nx, ny) = (start.x + v[0], start.y + v[1])
        
        if nx < -5 || nx > 5 || ny < -5 || ny > 5 { continue }
        
        let end = Coordinates(x: nx, y: ny)
        
        let startToEnd = CoordinatesSet(start: start, end: end)
        let endToStart = CoordinatesSet(start: end, end: start)
        
        if !cSet.contains(startToEnd) && !cSet.contains(endToStart) {
            cSet.insert(startToEnd)
            cSet.insert(endToStart)
        }
        start = end
    }
    
    return cSet.count / 2
}

// 이전 실패 풀이
// struct Coordinates: Hashable {
//     let i: Int
//     let j: Int
//     let d: Character
// }

// func solution(_ dirs:String) -> Int {
//     var cSet: Set<Coordinates> = []
//     var d: [Character: [Int]] = ["U": [1,0],"D": [-1,0],"L": [0,-1],"R": [0,1]]
//     var s = (0,0)
//     var answer = 0
    
//     for dir in dirs {
//         guard let v = d[dir] else { break }
//         let (ni,nj) = (s.0 + v[0], s.1 + v[1])
        
//         if ni < -5 || ni > 5 || nj < -5 || nj > 5 { continue }
//         s = (ni, nj)
        
//         let coordinates = Coordinates(i: ni, j: nj, d: dir)
//         if !cSet.contains(coordinates) {
//             answer += 1
//             cSet.insert(coordinates)
//         }
//     }
    
//     return answer
// }