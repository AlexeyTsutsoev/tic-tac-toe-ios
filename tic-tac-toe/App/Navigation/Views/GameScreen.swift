import SwiftUI

struct GameScreen: View {
    @Environment(NavigatorViewModel.self) private var navigator
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        GameView(
            viewModel: GameViewModel(
                onGoHome: navigator.reset,
                useCase: Dependencies.shared.getGameUseCase(context: modelContext)
            )
        )
    }
}
