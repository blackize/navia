import Foundation

class CourseService {
    static let shared = CourseService()
    private init() {}
    
    private let baseURL = "https://raw.githubusercontent.com/blackize/navia/sideways-stygimoloch/docs"
    
    func getCoursePaths() -> [CareerPath] {
        return [
            CareerPath(
                id: "frontend-developer",
                title: "Frontend Developer",
                description: "Complete guide to becoming a frontend developer",
                modules: [
                    Module(id: "m1", title: "HTML Fundamentals", lessons: [
                        Lesson(id: "l1", title: "Introduction to HTML", vimeoID: "123456789", duration: "10 min"),
                        Lesson(id: "l2", title: "HTML Elements", vimeoID: "123456790", duration: "15 min"),
                        Lesson(id: "l3", title: "HTML Forms", vimeoID: "123456791", duration: "12 min")
                    ]),
                    Module(id: "m2", title: "CSS Basics", lessons: [
                        Lesson(id: "l4", title: "CSS Selectors", vimeoID: "123456792", duration: "14 min"),
                        Lesson(id: "l5", title: "Flexbox", vimeoID: "123456793", duration: "18 min"),
                        Lesson(id: "l6", title: "CSS Grid", vimeoID: "123456794", duration: "20 min")
                    ])
                ],
                duration: "8 weeks",
                difficulty: "Beginner",
                outcome: "Become Frontend Developer"
            ),
            CareerPath(
                id: "python-developer",
                title: "Python Developer",
                description: "Learn Python programming",
                modules: [
                    Module(id: "m1", title: "Python Basics", lessons: [
                        Lesson(id: "l1", title: "Variables and Types", vimeoID: "223456789", duration: "15 min"),
                        Lesson(id: "l2", title: "Control Flow", vimeoID: "223456790", duration: "20 min")
                    ])
                ],
                duration: "6 weeks",
                difficulty: "Beginner",
                outcome: "Become Python Developer"
            )
        ]
    }
    
    func fetchCoursesFromGitHub() async throws -> [CareerPath] {
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