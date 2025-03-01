import Observation

@Observable final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Properties

    var streak = 0

    var winCount = 0

    var loseCount = 0

    var ratio = 1.0

    // MARK: - Init

    init(onGoToGame: @escaping () -> Void) {
        self.onGoToGame = onGoToGame
    }

    // MARK: - Open Methods

    var onGoToGame: () -> Void
}
