/// protocol with declare logic for home screen
protocol HomeViewModelProtocol {
    /// best unbroken streak of wins
    var streak: Int { get }
    /// count of wins
    var winCount: Int { get }
    /// count of loses
    var loseCount: Int { get }
    /// ratio of wins and losses
    var ratio: Double { get }

    /// method for navigate to game
    var onGoToGame: () -> Void { get }
}
