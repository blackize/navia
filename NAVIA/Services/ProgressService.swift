import Foundation

class ProgressService {
    static let shared = ProgressService()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    func updateProgress(pathId: String, lessonId: String, completionPercent: Double) {
        let key = "path_\(pathId)_lesson_\(lessonId)"
        userDefaults.set(completionPercent, forKey: key)
        
        let pathKey = "path_\(pathId)_progress"
        let totalKey = "path_\(pathId)_total"
        
        let currentTotal = userDefaults.double(forKey: totalKey)
        let newTotal = currentTotal + completionPercent
        userDefaults.set(newTotal, forKey: pathKey)
        userDefaults.set(newTotal, forKey: totalKey)
    }
    
    func getProgress(pathId: String, lessonId: String) -> Double {
        let key = "path_\(pathId)_lesson_\(lessonId)"
        return userDefaults.double(forKey: key)
    }
    
    func getPathProgress(pathId: String) -> Double {
        let pathKey = "path_\(pathId)_progress"
        let totalKey = "path_\(pathId)_total"
        let progress = userDefaults.double(forKey: pathKey)
        let total = userDefaults.double(forKey: totalKey)
        return total > 0 ? min(1.0, progress / total) : 0
    }
    
    func getLastWatchedLesson(for pathId: String) -> String? {
        return userDefaults.string(forKey: "last_watched_\(pathId)")
    }
    
    func setLastWatchedLesson(_ lessonId: String, pathId: String) {
        userDefaults.set(lessonId, forKey: "last_watched_\(pathId)")
    }
}