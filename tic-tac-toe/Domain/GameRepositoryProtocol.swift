import Foundation

protocol GameRepositoryProtocol {
    func postResult(win: Bool, date: Date) async throws
    func getBestStreak() -> Int
}
