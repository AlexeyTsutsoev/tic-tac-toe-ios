import SwiftUI

// MARK: - Routes

/// list of possible routes
enum NavigationRoute {
    case home
    case game
}

// MARK: - Presentation

extension NavigationRoute: View {
    var body: some View {
        switch self {
        case .home:
            EmptyView() // screen will be here
        case .game:
            EmptyView() // screen will be here
        }
    }
}

// MARK: - Hashable

extension NavigationRoute: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}
