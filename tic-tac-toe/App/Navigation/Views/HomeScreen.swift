import SwiftUI

struct HomeScreen: View {
    @Environment(NavigatorViewModel.self) private var navigator
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        HomeView(
            viewModel: HomeViewModel(
                onGoToGame: { navigator.push(destination: .game) },
                useCase: Dependencies.shared.getGameUseCase(context: modelContext)
            )
        )
    }
}
