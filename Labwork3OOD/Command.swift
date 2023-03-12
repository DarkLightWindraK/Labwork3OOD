import Foundation

protocol Command {
    func execute()
    func undo()
}

final class OneStepCommand: Command {
    let i, j: Int
    
    private weak var game: Game?
    
    init(i: Int, j: Int, game: Game) {
        self.i = i
        self.j = j
        self.game = game
    }
    
    func execute() {
        game?.makeStep(i: i, j: j)
    }
    
    func undo() {
        game?.undoStep(i: i, j: j)
    }
}
