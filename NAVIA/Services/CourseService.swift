import Foundation

class CourseService {
    static let shared = CourseService()
    private init() {}
    
    private let baseURL = "https://raw.githubusercontent.com/blackize/navia/sideways-stygimoloch/docs"
    
    func fetchCourses() async throws -> [CareerPath] {
        let url = URL(string: "\(baseURL)/it-specialization.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CoursesResponse.self, from: data)
        return response.courses
    }
}

struct CoursesResponse: Codable {
    let courses: [CareerPath]
}

struct OnboardingAnswers {
    var interest: String?
    var experience: String?
    var goal: String?
    var time: Int?
}