// 베스트앨범
// 시간: 1시간

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var ans = [Int]()
    let genreSet = Set<String>(genres)
    var totalPlayPerGenre = [String: Int]()
    var totalPlayPerSong = [String: [[Int]]]()

    for genre in genreSet {
        totalPlayPerGenre[genre] = 0
        totalPlayPerSong[genre] = [[Int]]()
    }

    for i in 0..<genres.count {
        totalPlayPerGenre[genres[i]]! += plays[i]
        totalPlayPerSong[genres[i]]?.append([plays[i], i])
    }

    for k in totalPlayPerSong.keys {
        totalPlayPerSong[k]?.sort{ ($0[0], $1[1]) > ($1[0], $0[1]) }
    }

    for (k, _) in totalPlayPerGenre.sorted(by: { $0.1 > $1.1 } ) {
        if totalPlayPerSong[k]!.count > 1 {
            ans.append(totalPlayPerSong[k]![0][1])
            ans.append(totalPlayPerSong[k]![1][1])
        }
        else {
            ans.append(totalPlayPerSong[k]![0][1])
        }
    }

    return ans
}
