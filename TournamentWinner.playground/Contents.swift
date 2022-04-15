import UIKit
//2022-04-10

func tournamentWinner(_ competitions: [[String]], _ results: [Int]) -> String {
    // Write your code here.
    var winningTeam = competitions[0][0]
    var hashMap: [String: Int] = [:]
    hashMap[winningTeam] = 0
    for index in 0..<competitions.count {
        print(competitions[index])
        print("0 hashMap: ", hashMap)
        if results[index] == 1 {
            //home team won.
            print("H: ", index, competitions[index], results[index])
            if hashMap[competitions[index][0]] != nil {
                hashMap[competitions[index][0]]! += 3
            } else {
                hashMap[competitions[index][0]] = 3
            }
            if let w = hashMap[winningTeam] {
                if let x = hashMap[competitions[index][0]] {
                    if w < x {
                        winningTeam = competitions[index][0]
                        print("now the winning team is :", winningTeam)
                    }
                }
            }
        } else {
            //away team won.
            print("A: ", index, competitions[index], results[index])
            if hashMap[competitions[index][1]] != nil {
                hashMap[competitions[index][1]]! += 3
            } else {
                hashMap[competitions[index][1]] = 3
            }
            if let w = hashMap[winningTeam] {
                print("w: ", w)
                if let x = hashMap[competitions[index][1]] {
                    if w < x {
                        winningTeam = competitions[index][1]
                        print("now the winning team is :", winningTeam)
                    }
                }
            }
        }
        
    }
    print("winningTeam: ", winningTeam)
    print("hashMap: ", hashMap)
    print(hashMap.values.max())
    //    let key = hashMap.e
    return winningTeam
}
var competitions: [[String]] = [["A", "B"],["B", "C"], ["C", "A"]] // A is the winner.
var results: [Int] = [1, 0, 0]
//print("and the winnging team is: ", tournamentWinner(competitions, results))

print("\n1")
competitions =  [
    ["HTML", "C#"],
    ["C#", "Python"],
    ["Python", "HTML"]
]
results = [0, 0, 1]
//print("and the winnging team is: ", tournamentWinner(competitions, results))

print("\nAlgo Expert Solutions")
func tournamentWinner2(_ competitions: [[String]], _ results: [Int]) -> String {
    let HOME_TEAM_WON = 1
    var scores = [String: Int]()
    var currentBestTeam = ""
    scores[currentBestTeam] = 0
    for (idx, competition) in competitions.enumerated() {
        print(idx, competition)
        let result = results[idx]
        let (homeTeam, awayTeam) = (competition[0], competition[1])
        var winningTeam = awayTeam
        if result == HOME_TEAM_WON {
            winningTeam = homeTeam
        }
        if scores[winningTeam] == nil {
            scores[winningTeam] = 0 //insert for the first time
        }
        scores[winningTeam] = scores[winningTeam]! + 3
        
        if scores[winningTeam]! > scores[currentBestTeam]! {
            currentBestTeam = winningTeam
        }
    }
    return currentBestTeam
}
//print("winner: ", tournamentWinner2(competitions, results))

print("\nBun Again")
func tournamentWinner3(_ competitions: [[String]], _ results: [Int]) -> String {
    
    var bestTeam = ""
    var scores = [String: Int]()
    scores[bestTeam] = 0
    for index in 0..<competitions.count {
        let winningTeam = results[index] == 0 ? competitions[index][1] : competitions[index][0]
        if scores[winningTeam] == nil {
            scores[winningTeam] = 0
        }
        scores[winningTeam]! += 3
        if scores[bestTeam]! < scores[winningTeam]! {
            bestTeam = winningTeam
        }
    }
    print("scores: ", scores)
    print("bestTeam: ", bestTeam)
    return bestTeam
}
print("winner: ", tournamentWinner3(competitions, results))




















