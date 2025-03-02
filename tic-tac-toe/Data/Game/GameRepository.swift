import Foundation
import SwiftData

final class GameRepository: GameRepositoryProtocol {
    private let api: MockGameApiService
    private let context: ModelContext
    private let streakStorage: StreakStorageProtocol

    init(api: MockGameApiService, context: ModelContext, streakStorage: StreakStorageProtocol) {
        self.api = api
        self.context = context
        self.streakStorage = streakStorage
    }

    @MainActor
    func postResult(win: Bool, date: Date) async throws {
        streakStorage.setBestStreak(win: win)
        context.insert(GameResult(date: date, win: win))
        try await api.postResult(win: win)
    }

    func getBestStreak() -> Int {
        return streakStorage.getBestStreak()
    }
}
