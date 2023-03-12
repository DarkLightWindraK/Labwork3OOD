import Foundation

final class GameView {
    private var game: Game
    
    init(game: Game) {
        self.game = game
    }
    
    func printGameField() {
        print("=============")
        for row in game.gameField {
            for column in row {
                print(column.rawValue, terminator: " ")
            }
            print()
        }
    }
    
    func getCurrentPlayer() -> String {
        game.players[game.currentPlayerIndex].playerType.rawValue
    }
    
    func sendCurrentPlayerAction(i: Int, j: Int) {
        game.players[game.currentPlayerIndex].doStep(action: OneStepCommand(i: i, j: j, game: game))
    }
    
    func undoPreviousAction() {
        game.players[1 - game.currentPlayerIndex].undoStep()
    }
    
    func isGameEnded() -> Bool {
        game.isEnded
    }
}
