import SwiftUI

struct Navigator: View {
    @State private var viewModel: NavigatorViewModel

    init(viewModel: NavigatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack(path: $viewModel.stack) {
            HomeScreen()
                .navigationDestination(
                    for: NavigationRoute.self,
                    destination: { $0 }
                )
        }
        .environment(viewModel)
    }
}
