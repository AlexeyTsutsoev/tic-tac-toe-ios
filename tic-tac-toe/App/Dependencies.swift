import Foundation
import SwiftData

/// simple service locator
/// It's anti-pattern, but I use it because no DI lib and it's very simple. I believe we can use it for now
final class Dependencies {
    static let shared = Dependencies()

    private init() {}

    private var gameRepo: GameRepositoryProtocol?
    private var gameUseCase: GameUseCase?

    func getGameUseCase(context: ModelContext) -> GameUseCase {
        if let gameUseCase {
            return gameUseCase
        }

        let newRepo = GameRepository(
            api: MockGameApiService(),
            context: context,
            streakStorage: BestStreakStorage()
        )
        gameRepo = newRepo

        let newUseCase = GameUseCase(
            repo: newRepo
        )
        gameUseCase = newUseCase

        return newUseCase
    }
}
