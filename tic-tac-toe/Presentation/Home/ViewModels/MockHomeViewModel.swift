import Observation

@Observable final class MockHomeViewModel: HomeViewModelProtocol {
    // MARK: - Properties

    var streak = 0

    var winCount = 0

    var loseCount = 0

    var ratio = 1.0

    // MARK: - Open methods

    var onGoToGame: () -> Void = {

    }

    func checkBestStreak() {
        streak = Int.random(in: 1...50)
    }

    func calculateStatistic(results: [GameResult]) {
        winCount = Int.random(in: 1...50)
        loseCount = Int.random(in: 1...50)
        ratio = Double(winCount) / Double(loseCount)
    }
}
