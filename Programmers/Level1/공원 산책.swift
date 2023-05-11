// 공원 산책
// 문제 유형: 시뮬레이션
// 느낀점: 구현할 때 row, column과 x, y를 일관되게 구현할 것.

import Foundation

struct Matrix {
    var row: Int
    var column: Int
}

var n = 0
var m = 0
var location = Matrix(row: 0, column: 0)
var graph = [[String]]()
let direction = ["N": (-1,0), "S": (1,0), "W": (0,-1), "E": (0,1)]

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    n = park.count
    
    for i in 0..<park.count {
        let pArray = Array(park[i]).map { String($0) }
        m = pArray.count
        graph.append(pArray)
        
        for j in 0..<pArray.count {
            if pArray[j] == "S" {
                (location.row, location.column) = (i, j)
            }
        }
    }
    
    for route in routes {
        let split = route.components(separatedBy: " ")
        let d = split[0]
        let v = Int(split[1]) ?? 0
        move(d, v)
    }
    
    return [location.row, location.column]
}

func move(_ d: String, _ v: Int) {
    guard let dir = direction[d] else { print("afaf"); return }
    var ni = location.row
    var nj = location.column
    
    for i in 1...v {
        ni += dir.0
        nj += dir.1

        if !isBoundary(ni, nj) { return }
        if graph[ni][nj] == "X" { return }
        
        if i == v { 
            location.row = ni
            location.column = nj
        }
    }
}

func isBoundary(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}