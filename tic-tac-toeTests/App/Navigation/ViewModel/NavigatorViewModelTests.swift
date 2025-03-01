import SwiftUI
import Testing

@testable import tic_tac_toe

struct NavigatorViewModelTests {
    private let navigator = NavigatorViewModel()

    // MARK: - Checks

    private let firstCheck: [NavigationRoute] = [.game]
    private let secondCheck: [NavigationRoute] = [.game, .home]
    private let thirdCheck: [NavigationRoute] = [.game, .home, .game]
    private let fourthCheck: [NavigationRoute] = [.game, .home]
    private let finalCheck: [NavigationRoute] = []

    @Test func test_navigation_flow() {
        #expect(navigator.stack.count == 0, "Initial stack must be empty")

        navigator.push(destination: .game)

        checkStackElementsHelper(target: firstCheck)

        navigator.push(destination: .home)

        checkStackElementsHelper(target: secondCheck)

        navigator.push(destination: .game)

        checkStackElementsHelper(target: thirdCheck)

        navigator.goBack()

        checkStackElementsHelper(target: fourthCheck)

        navigator.reset()

        checkStackElementsHelper(target: finalCheck)
    }

    private func checkStackElementsHelper(target: [NavigationRoute]) {
        #expect(navigator.stack.count == target.count, "Arrays count must be equal")

        navigator.stack.enumerated().forEach { index, route in

            #expect(route == target[index], "Elements in stack must be equals")
        }
    }
}
