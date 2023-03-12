import Foundation

final class GameView {
    private(set) var game: Game
    
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
    
    func getCurrentPlayer() -> String {
        game.players[gameView.game.currentPlayerIndex].playerType.rawValue
    }
    
    func sendCurrentPlayerAction(command: Command) {
        game.players[gameView.game.currentPlayerIndex].doStep(action: command)
    }
    
    func undoPreviousAction() {
        game.players[game.players.count - gameView.game.currentPlayerIndex].undoStep()
    }
}
