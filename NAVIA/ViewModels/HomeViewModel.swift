import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var recommendedPath: CareerPath?
    @Published var alternativePaths: [CareerPath] = []
    @Published var lastWatchedLesson: Lesson?
    
    init() {
        loadData()
    }
    
    private func loadData() {
        recommendedPath = mockCareerPath()
        alternativePaths = [mockCareerPath(), mockCareerPath()]
        lastWatchedLesson = mockLesson()
    }
    
    private func mockCareerPath() -> CareerPath {
        CareerPath(
            id: "1",
            title: "Frontend Developer",
            description: "Become a modern frontend developer",
            modules: [
                Module(id: "m1", title: "HTML & CSS", lessons: [mockLesson()]),
                Module(id: "m2", title: "JavaScript", lessons: [mockLesson()])
            ],
            duration: "4 weeks",
            difficulty: "Beginner",
            outcome: "Become Frontend Developer"
        )
    }
    
    private func mockLesson() -> Lesson {
        Lesson(
            id: "l1",
            title: "Introduction to HTML",
            videoURL: "https://example.com/video.mp4",
            duration: "10 min",
            isCompleted: false
        )
    }
}