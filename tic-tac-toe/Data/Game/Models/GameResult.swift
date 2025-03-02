import Foundation
import SwiftData

@Model
final class GameResult {
    var date: Date
    var win: Bool

    init(date: Date, win: Bool) {
        self.date = date
        self.win = win
    }
}
