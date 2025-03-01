import SwiftUI

struct Navigator: View {
    @State private var viewModel: NavigatorViewModel
    
    init(viewModel: NavigatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack(path: $viewModel.stack) {
            EmptyView()
                .navigationDestination(
                    for: NavigationRoute.self,
                    destination: { $0 }
                )
        }
        .environment(viewModel)
    }
}
