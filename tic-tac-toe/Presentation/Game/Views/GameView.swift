import SwiftUI

/// view for render game board
struct GameView: View {
    // MARK: - State

    @State private var viewModel: GameViewModelProtocol

    // MARK: - Init

    init(viewModel: GameViewModelProtocol) {
        self._viewModel = State(initialValue: viewModel)
    }

    // MARK: - Render

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)
                .padding()

            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3),
                spacing: 10
            ) {
                ForEach(0..<3, id: \.self) { row in
                    ForEach(0..<3, id: \.self) { col in
                        Button {
                            viewModel.makeMove(row: row, col: col)
                        } label: {
                            Text(viewModel.board[row][col].rawValue)
                                .font(.system(size: 50))
                                .frame(width: 80, height: 80)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                        }
                        .disabled(viewModel.board[row][col] != Cell.none || viewModel.winner != nil)
                    }
                }
            }
            .padding()

            // will be removed
            Button {
                viewModel.resetGame()
            } label: {
                Text("Reset Game")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 20)
        }
        .onChange(of: viewModel.winner) { _, newValue in
            if newValue != nil {
                viewModel.toggleAlert()
            }
        }
        .alert(viewModel.title, isPresented: $viewModel.alertPresented) {
            Button {
                viewModel.resetGame()
            } label: {
                Text("Play Again")
            }

            Button {
                viewModel.resetGame()
            } label: {
                Text("Go to home")
            }
        }
    }
}

// MARK: - Preview

#Preview {
    GameView(viewModel: MockGameViewModel())
}
