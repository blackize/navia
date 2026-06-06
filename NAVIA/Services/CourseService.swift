import Foundation

class CourseService {
    static let shared = CourseService()
    private init() {}
    
    func getCoursePaths() -> [CareerPath] {
        return [
            CareerPath(
                id: "frontend",
                title: "Frontend Developer",
                description: "Learn HTML, CSS, JavaScript and React",
                modules: [
                    Module(id: "m1", title: "HTML Fundamentals", lessons: [
                        Lesson(id: "l1", title: "Introduction to HTML", videoURL: "https://example.com/html1.mp4", duration: "10 min"),
                        Lesson(id: "l2", title: "HTML Elements", videoURL: "https://example.com/html2.mp4", duration: "15 min")
                    ]),
                    Module(id: "m2", title: "CSS Basics", lessons: [
                        Lesson(id: "l3", title: "CSS Selectors", videoURL: "https://example.com/css1.mp4", duration: "12 min"),
                        Lesson(id: "l4", title: "Flexbox", videoURL: "https://example.com/css2.mp4", duration: "20 min")
                    ])
                ],
                duration: "4 weeks",
                difficulty: "Beginner",
                outcome: "Become Frontend Developer"
            ),
            CareerPath(
                id: "python",
                title: "Python Developer",
                description: "Learn Python programming from basics to advanced",
                modules: [
                    Module(id: "m1", title: "Python Basics", lessons: [
                        Lesson(id: "l1", title: "Variables and Types", videoURL: "https://example.com/py1.mp4", duration: "15 min"),
                        Lesson(id: "l2", title: "Control Flow", videoURL: "https://example.com/py2.mp4", duration: "20 min")
                    ])
                ],
                duration: "6 weeks",
                difficulty: "Beginner",
                outcome: "Become Python Developer"
            )
        ]
    }
    
    func getRecommendations(user: User, answers: OnboardingAnswers) -> [CareerPath] {
        let paths = getCoursePaths()
        return Array(paths.prefix(3))
    }
}

struct OnboardingAnswers {
    var interest: String?
    var experience: String?
    var goal: String?
    var time: Int?
}