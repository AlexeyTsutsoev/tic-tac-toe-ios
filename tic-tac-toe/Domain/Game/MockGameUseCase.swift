import Foundation

/// mock use case for work with data layer
final class MockGameUseCase {
    /// I use api service without repository. for now
    private let api: MockGameApiService

    init(api: MockGameApiService) {
        self.api = api
    }

    /// mock posing game result
    func sendResult(win: Bool, date: Date = .now) async throws {
        try await api.postResult(win: win, date: date)
    }
}
