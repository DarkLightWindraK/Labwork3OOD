import Foundation

class GameView {
    var game: Game
    
    init(players: [Player]) {
        self.game = Game(players: players)
    }
    
    func startNewGame() {
        game = Game(players: game.players)
    }
    
    func printGameField() {
        print("============")
        for row in game.gameField {
            for column in row {
                print(column.rawValue, terminator: " ")
            }
            print()
        }
    }
}
