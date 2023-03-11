import Foundation

let playerX: Player = .init(playerType: .X)
let playerO: Player = .init(playerType: .O)
let gameView = GameView(players: [playerX, playerO])

while (!gameView.game.isEnded) {
    gameView.printGameField()
    print("Ход игрока: \(gameView.game.players[gameView.game.currentPlayerIndex].playerType.rawValue)")
    print("Выберите команду: step, чтобы сделать ход, или cancel, для отмены предыдущего хода")
    let action = readLine()
    switch action?.lowercased() {
    case Operation.step.rawValue:
        print("Введите индекс ячейки для ввода")
        let data = readLine()?.split(separator: " ").compactMap { Int($0) } ?? []
        guard data.count == 2 else { continue }
        
        let (i, j) = (data[0], data[1])
        let command = OneStepCommand(i: i, j: j, game: gameView.game)
        gameView.game.players[gameView.game.currentPlayerIndex].doStep(action: command)
    case Operation.cancel.rawValue:
        gameView.game.players[1 - gameView.game.currentPlayerIndex].undoStep()
    default:
        continue
    }
}

print("Победил: \(gameView.game.players[1 - gameView.game.currentPlayerIndex].playerType.rawValue)")

