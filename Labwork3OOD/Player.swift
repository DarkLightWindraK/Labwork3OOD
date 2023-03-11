import Foundation

enum PlayerType: String {
    case X, O
}

class Player {
    let playerType: PlayerType
    
    private var commands: [Command] = []
    
    init(playerType: PlayerType) {
        self.playerType = playerType
    }
    
    func doStep(action: Command) {
        commands.append(action)
        action.execute()
    }
    
    func undoStep() {
        guard !commands.isEmpty else { return }
        
        commands.last!.undo()
        commands.removeLast()
    }
}
