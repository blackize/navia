import Foundation

struct Lesson: Codable, Identifiable {
    let id: String
    let title: String
    let vimeoID: String
    let duration: String
    var isCompleted: Bool = false
    
    var videoURL: String {
        "https://player.vimeo.com/video/\(vimeoID)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, duration, isCompleted
        case vimeoID = "vimeo_id"
    }
}