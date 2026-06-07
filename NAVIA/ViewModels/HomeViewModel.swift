import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var recommendedPath: CareerPath?
    @Published var alternativePaths: [CareerPath] = []
    @Published var lastWatchedLesson: Lesson?
    @Published var isLoading = false
    
    init() {
        loadCourses()
    }
    
    private func loadCourses() {
        Task {
            isLoading = true
            do {
                let paths = try await CourseService.shared.fetchCoursesFromGitHub()
                await MainActor.run {
                    recommendedPath = paths.first
                    alternativePaths = Array(paths.dropFirst().prefix(2))
                    
                    if let firstPath = recommendedPath,
                       let firstModule = firstPath.modules.first,
                       let firstLesson = firstModule.lessons.first {
                        lastWatchedLesson = firstLesson
                    }
                }
            } catch {
                print("Failed to load courses: \(error)")
                await MainActor.run {
                    let paths = CourseService.shared.getCoursePaths()
                    recommendedPath = paths.first
                    alternativePaths = Array(paths.dropFirst().prefix(2))
                }
            }
            isLoading = false
        }
    }
}