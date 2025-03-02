import Foundation

final class BestStreakStorage: StreakStorageProtocol {
    // MARK: - Private Methods

    private let defaults = UserDefaults.standard
    private let currentKey = "CURRENT_KEY"
    private let bestKey = "BEST_KEY"

    // MARK: - Open Methods

    func getBestStreak() -> Int {
        return defaults.integer(forKey: bestKey)
    }

    func setBestStreak(win: Bool) {
        if win {
            let previous = defaults.integer(forKey: currentKey)
            let newStreak = previous + 1
            UserDefaults.standard.set(newStreak, forKey: currentKey)

            let best = defaults.integer(forKey: bestKey)
            if newStreak > best {
                defaults.set(newStreak, forKey: bestKey)
            }
        } else {
            UserDefaults.standard.set(0, forKey: currentKey)
        }
    }

}
