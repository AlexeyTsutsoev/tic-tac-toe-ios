/// Protocol for declare business logic for game view
protocol GameViewModelProtocol {
    /// Matrix for render cells
    var board: [[Cell]] { get }
    /// Current player
    var current: Cell { get }
    /// Field store winning symbol
    var winner: Cell? { get }

    /// Store title for game
    var title: String { get }
    /// flag for showing an alert
    var alertPresented: Bool { get set }

    /// method from navigation for slocing game
    var onGoHome: () -> Void { get }

    /// incapsulate alert management
    func toggleAlert()

    /// logic for change board state
    func makeMove(row: Int, col: Int)

    /// every makeMove call check win
    func checkWinner()

    /// reset game after finish
    func resetGame()
}
