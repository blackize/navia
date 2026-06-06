import Foundation

struct CareerPath: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let modules: [Module]
    let duration: String
    let difficulty: String
    let outcome: String
    
    var progress: Double {
        guard !modules.isEmpty else { return 0 }
        let totalLessons = modules.flatMap { $0.lessons }.count
        let completedLessons = modules.flatMap { $0.lessons }.filter { $0.isCompleted }.count
        return Double(completedLessons) / Double(totalLessons)
    }
}