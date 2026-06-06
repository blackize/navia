import Foundation

struct Lesson: Codable, Identifiable {
    let id: String
    let title: String
    let videoURL: String
    let duration: String
    var isCompleted: Bool = false
}