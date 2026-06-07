import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var recommendedPath: CareerPath?
    @Published var alternativePaths: [CareerPath] = []
    @Published var lastWatchedLesson: Lesson?
    @Published var isLoading = false
    
    @MainActor
    func loadCourses() async {
        isLoading = true
        do {
            let paths = try await CourseService.shared.fetchCourses()
            recommendedPath = paths.first
            alternativePaths = Array(paths.dropFirst().prefix(2))
            
            if let firstPath = recommendedPath,
               let firstModule = firstPath.modules.first,
               let firstLesson = firstModule.lessons.first {
                lastWatchedLesson = firstLesson
            }
        } catch {
            print("Failed to load courses: \(error)")
        }
        isLoading = false
    }
    
    init() {
        Task {
            await loadCourses()
        }
    }
}