import Observation

@Observable final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Private properties

    private let useCase: GameUseCase

    // MARK: - Properties

    var streak = 0

    var winCount = 0

    var loseCount = 0

    var ratio: Double {
        Double(winCount == 0 ? 1 : winCount) / Double(loseCount == 0 ? 1 : loseCount)
    }

    // MARK: - Init

    init(onGoToGame: @escaping () -> Void, useCase: GameUseCase) {
        self.onGoToGame = onGoToGame
        self.useCase = useCase
    }

    // MARK: - Open Methods

    var onGoToGame: () -> Void

    func checkBestStreak() {
        streak = useCase.getBestStreak()
    }

    func calculateStatistic(results: [GameResult]) {
        var tempWinCount = 0
        var tempLoseCount = 0

        results.forEach { result in
            if result.win {
                tempWinCount += 1
            } else {
                tempLoseCount += 1
            }
        }

        winCount = tempWinCount
        loseCount = tempLoseCount
    }
}
