import Foundation

struct Lesson: Codable, Identifiable {
    let id: String
    let title: String
    let vimeoID: String?
    let duration: String
    var isCompleted: Bool = false
    
    var embedURL: URL? {
        guard let vimeoID = vimeoID else { return nil }
        return URL(string: "https://player.vimeo.com/video/\(vimeoID)")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, duration, isCompleted
        case vimeoID = "vimeo_id"
    }
    
    init(id: String, title: String, vimeoID: String?, duration: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.vimeoID = vimeoID
        self.duration = duration
        self.isCompleted = isCompleted
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        duration = try container.decode(String.self, forKey: .duration)
        isCompleted = try container.decodeIfPresent(Bool.self, forKey: .isCompleted) ?? false
        vimeoID = try container.decodeIfPresent(String.self, forKey: .vimeoID)
    }
}