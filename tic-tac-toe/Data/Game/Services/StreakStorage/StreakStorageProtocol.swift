/// protocol for getting best streak in repo
protocol StreakStorageProtocol {
    /// returns best streak
    func getBestStreak() -> Int
    /// check current streak and set if it new best
    func setBestStreak(win: Bool)
}
