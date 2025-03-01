import Observation

@Observable final class GameViewModel: GameViewModelProtocol {
    // MARK: - Game Properties

    var board: [[Cell]] = Array(
        repeating: Array(repeating: .none, count: 3),
        count: 3
    )

    var current: Cell = .tic

    var winner: Cell?

    // MARK: - UI Properties

    var title: String {
        return winner == nil
            ? "Turn: \(current.rawValue)"
            : (winner == Cell.none
                ? "Drawn" : "Winner is \(winner!.rawValue)")
    }

    var alertPresented = false

    // MARK: - Init

    init(onGoHome: @escaping () -> Void) {
        self.onGoHome = onGoHome
    }

    // MARK: - Open Methods

    let onGoHome: () -> Void

    func makeMove(row: Int, col: Int) {
        guard winner == nil else { return }
        guard board[row][col] == .none else { return }

        board[row][col] = current
        checkWinner()
        current = current == .tic ? .tac : .tic
    }

    func toggleAlert() {
        alertPresented.toggle()
    }

    func checkWinner() {
        for index in 0..<3 {
            let winRow =
                board[index][0] != .none && board[index][0] == board[index][1]
                && board[index][1] == board[index][2]

            if winRow {
                winner = board[index][0]
            }

            let winColumn =
                board[0][index] != .none && board[0][index] == board[1][index]
                && board[1][index] == board[2][index]

            if winColumn {
                winner = board[0][index]
            }
        }

        let winDiagonalFromTopLeftToBottomRight =
            board[0][0] != .none
            && board[0][0] == board[1][1]
            && board[1][1] == board[2][2]

        if winDiagonalFromTopLeftToBottomRight {
            winner = board[0][0]
        }

        let winDiagonalFromTopRightToBottomLeft =
            board[0][2] != .none
            && board[0][2] == board[1][1]
            && board[1][1] == board[2][0]

        if winDiagonalFromTopRightToBottomLeft {
            winner = board[0][2]
        }

        let allCellFilled = board.allSatisfy({ row in row.allSatisfy { $0 != .none } })

        if allCellFilled {
            winner = Cell.none
        }
    }

    func resetGame() {
        board = Array(repeating: Array(repeating: .none, count: 3), count: 3)
        current = .tic
        winner = nil
        alertPresented = false
    }

}
