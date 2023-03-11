import Foundation

enum Cell: String {
    case X, O
    case Empty = "-"
}

final class Game {
    private(set) var gameField: [[Cell]] = Array(repeating: Array(repeating: Cell.Empty, count: 3), count: 3)
    var currentPlayerIndex: Int
    let players: [Player]
    var isEnded: Bool
    
    init(players: [Player]) {
        self.players = players
        isEnded = false
        currentPlayerIndex = Int.random(in: 0...1)
    }
    
    func makeStep(i: Int, j: Int) {
        guard
            i < 3,
            j < 3,
            gameField[i][j] == Cell.Empty
        else {
            return
        }
        
        gameField[i][j] = Cell(rawValue: players[currentPlayerIndex].playerType.rawValue)!
        changeCurrentPlayer()
        isEnded = checkIfWon(i: i, j: j)
    }
    
    func undoStep(i: Int, j: Int) {
        guard
            i < 2,
            j < 2,
            gameField[i][j] != Cell.Empty
        else {
            return
        }
        
        gameField[i][j] = Cell.Empty
        changeCurrentPlayer()
    }
}

private extension Game {
    func changeCurrentPlayer() {
        currentPlayerIndex = (currentPlayerIndex + 1) % 2
    }
    func checkIfWon(i: Int, j: Int) -> Bool {
        checkHorizontal(i: i) || checkVertical(j: j) || checkMainDiagonal() || checkAnotherDiagonal()
    }
    func checkHorizontal(i: Int) -> Bool {
        var counterX = 0, counterO = 0
        for index in 0..<gameField.count {
            switch gameField[i][index] {
            case .O:
                counterO += 1
            case .X:
                counterX += 1
            default:
                break
            }
        }
        return counterX == 3 || counterO == 3
    }
    func checkVertical(j: Int) -> Bool {
        var counterX = 0, counterO = 0
        for index in 0..<gameField.count {
            switch gameField[index][j] {
            case .O:
                counterO += 1
            case .X:
                counterX += 1
            default:
                break
            }
        }
        return counterX == 3 || counterO == 3
    }
    func checkMainDiagonal() -> Bool {
        var counterX = 0, counterO = 0
        for index in 0..<gameField.count {
            switch gameField[index][index] {
            case .O:
                counterO += 1
            case .X:
                counterX += 1
            default:
                break
            }
        }
        return counterX == 3 || counterO == 3
    }
    func checkAnotherDiagonal() -> Bool {
        var counterX = 0, counterO = 0
        for index in 0..<gameField.count {
            switch gameField[index][gameField.count - index - 1] {
            case .O:
                counterO += 1
            case .X:
                counterX += 1
            default:
                break
            }
        }
        return counterX == 3 || counterO == 3
    }
}
