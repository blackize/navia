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
        let paths = CourseService.shared.getCoursePaths()
        recommendedPath = paths.first
        alternativePaths = Array(paths.dropFirst().prefix(2))
        
        if let firstPath = recommendedPath,
           let firstModule = firstPath.modules.first,
           let firstLesson = firstModule.lessons.first {
            lastWatchedLesson = firstLesson
        }
    }
}