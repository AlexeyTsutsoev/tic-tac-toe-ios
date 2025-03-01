import SwiftUI

struct HomeView: View {
    // MARK: - State

    @State private var viewModel: HomeViewModelProtocol

    // MARK: - Init
    init(viewModel: HomeViewModelProtocol) {
        self._viewModel = State(initialValue: viewModel)
    }

    // MARK: - Render

    var body: some View {
        VStack {
            Text("Best Streak: \(viewModel.streak)")
                .font(.title)

            Text("Wins: \(viewModel.winCount)")
                .font(.title2)

            Text("Loses: \(viewModel.loseCount)")
                .font(.title2)

            Text("Ratio: \(String(format: "%.2f", viewModel.ratio))")
                .font(.title2)

            Button {
                viewModel.onGoToGame()
            } label: {
                Text("Go to game")
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 20)

        }
    }
}

// MARK: - Preview

#Preview {
    HomeView(viewModel: MockHomeViewModel())
}
