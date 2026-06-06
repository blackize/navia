import Foundation

struct Module: Codable, Identifiable {
    let id: String
    let title: String
    let lessons: [Lesson]
}