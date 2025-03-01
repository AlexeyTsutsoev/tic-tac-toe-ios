import SwiftUI

struct GameScreen: View {
    @Environment(NavigatorViewModel.self) private var navigator

    var body: some View {
        GameView(
            viewModel: GameViewModel(
                onGoHome: navigator.reset,
                useCase: MockGameUseCase(api: MockGameApiService())
            )
        )
    }
}
