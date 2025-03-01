import SwiftUI

struct HomeScreen: View {
    @Environment(NavigatorViewModel.self) private var navigator

    var body: some View {
        HomeView(viewModel: HomeViewModel(onGoToGame: { navigator.push(destination: .game) }))
    }
}
