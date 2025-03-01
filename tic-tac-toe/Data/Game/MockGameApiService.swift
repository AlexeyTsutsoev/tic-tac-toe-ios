import Foundation

/// mock service for emulate async post game result.
/// I haven't add any extra dependencies for real request.
final class MockApiService {
    // MARK: - Example of Dependencies for common api service
//    private let session: URLSession
//    private let config: ApiServicesConfigProtocol
//    private let routeManager: RouteManagerProtocol

    // MARK: - Manual DI example without any DI libs
//    init(session: URLSession, config: ApiServicesConfigProtocol, routeManager: RouteManagerProtocol) {
//        self.session = session
//        self.config = config
//        self.routeManager = routeManager
//    }
    
    /// mock method
    func postResult(win: Bool, date: Date = .now) async throws {
        /// emulate delay
        try await Task.sleep(seconds: 2.0)
        print("Result sent")
    }
}
