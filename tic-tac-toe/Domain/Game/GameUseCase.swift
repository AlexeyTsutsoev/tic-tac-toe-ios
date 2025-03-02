import Foundation

/// Use case for work with data layer
final class GameUseCase {
    private let repo: GameRepositoryProtocol

    init(repo: GameRepositoryProtocol) {
        self.repo = repo
    }

    /// mock posing game result
    func sendResult(win: Bool, date: Date = .now) async throws {
        try await repo.postResult(win: win, date: date)
    }

    func getBestStreak() -> Int {
        return repo.getBestStreak()
    }
}
