import Testing

@testable import tic_tac_toe

struct GameViewModelTests {

    private let viewModel: GameViewModelProtocol
    
    init() {
        self.viewModel = GameViewModel(onGoHome: {})
    }

    // MARK: - Checks

    private let firstCheck: [[Cell]] = [
        [.none, .none, .none],
        [.none, .none, .none],
        [.none, .none, .none],
    ]
    
    private let secondCheck: [[Cell]] = [
        [.none, .none, .none],
        [.none, .tic, .none],
        [.none, .none, .none],
    ]
    
    private let thirdCheck: [[Cell]] = [
        [.tac, .none, .none],
        [.none, .tic, .none],
        [.none, .none, .none],
    ]
    
    private let fourthCheck: [[Cell]] = [
        [.tac, .tic, .none],
        [.none, .tic, .none],
        [.none, .none, .none],
    ]
    
    private let fifthCheck: [[Cell]] = [
        [.tac, .tic, .none],
        [.none, .tic, .none],
        [.none, .none, .tac],
    ]
    
    private let finalCheck: [[Cell]] = [
        [.tac, .tic, .none],
        [.none, .tic, .none],
        [.none, .tic, .tac],
    ]
    
    // MARK: - Tests

    @Test func test_game_flow() async throws {
        checkBoard(target: firstCheck)
        
        viewModel.makeMove(row: 1, col: 1)
        checkBoard(target: secondCheck)
        #expect(viewModel.winner == nil, "No winner for this check")
        
        viewModel.makeMove(row: 0, col: 0)
        checkBoard(target: thirdCheck)
        #expect(viewModel.winner == nil, "No winner for this check")
        
        viewModel.makeMove(row: 0, col: 1)
        checkBoard(target: fourthCheck)
        #expect(viewModel.winner == nil, "No winner for this check")
        
        viewModel.makeMove(row: 0, col: 1)
        checkBoard(target: fourthCheck)
        #expect(viewModel.winner == nil, "No winner for this check")
        
        viewModel.makeMove(row: 2, col: 2)
        checkBoard(target: fifthCheck)
        #expect(viewModel.winner == nil, "No winner for this check")
        
        viewModel.makeMove(row: 2, col: 1)
        checkBoard(target: finalCheck)
        #expect(viewModel.winner == .tic, "WInner should be tic")
    }

    // MARK: - Helpers

    private func checkBoard(target: [[Cell]]) {
        for (rowIndex, row) in viewModel.board.enumerated() {
            for (columnIndex, _) in row.enumerated() {
                #expect(
                    target[rowIndex][columnIndex] == viewModel.board[rowIndex][columnIndex],
                    "Cells \(rowIndex) \(columnIndex) should be equal"
                )
            }
        }
    }
}
