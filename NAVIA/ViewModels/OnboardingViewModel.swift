import Foundation
import SwiftUI
import Combine

enum Interest: String, CaseIterable {
    case development = "Development"
    case dataAI = "Data / AI"
    case design = "Design"
    case security = "Security"
    case testing = "Testing"
    case management = "Management"
}

enum ExperienceLevel: String, CaseIterable {
    case beginner = "Beginner"
    case basicKnowledge = "Basic knowledge"
    case workingInIT = "Working in IT"
}

enum Goal: String, CaseIterable {
    case changeCareer = "Change career"
    case getFirstJob = "Get first job"
    case increaseIncome = "Increase income"
    case learnNewSkill = "Learn new skill"
}

enum TimeAvailability: Int, CaseIterable {
    case min15 = 15
    case min30 = 30
    case min60 = 60
    case min120 = 120
    
    var displayText: String {
        switch self {
        case .min15: return "15 min/day"
        case .min30: return "30 min/day"
        case .min60: return "1 hour/day"
        case .min120: return "2+ hours/day"
        }
    }
}

class OnboardingViewModel: ObservableObject {
    @Published var selectedInterestRaw: String?
    @Published var selectedExperienceRaw: String?
    @Published var selectedGoalRaw: String?
    @Published var selectedTimeRaw: String?
    
    var selectedInterest: Interest? {
        get { Interest(rawValue: selectedInterestRaw ?? "") }
        set { selectedInterestRaw = newValue?.rawValue }
    }
    
    var selectedExperience: ExperienceLevel? {
        get { ExperienceLevel(rawValue: selectedExperienceRaw ?? "") }
        set { selectedExperienceRaw = newValue?.rawValue }
    }
    
    var selectedGoal: Goal? {
        get { Goal(rawValue: selectedGoalRaw ?? "") }
        set { selectedGoalRaw = newValue?.rawValue }
    }
    
    var selectedTime: TimeAvailability? {
        get { 
            guard let raw = selectedTimeRaw, let val = Int(raw) else { return nil }
            return TimeAvailability(rawValue: val)
        }
        set { selectedTimeRaw = newValue != nil ? String(newValue!.rawValue) : nil }
    }
    
    var canComplete: Bool {
        selectedInterest != nil && selectedExperience != nil && selectedGoal != nil && selectedTime != nil
    }
}