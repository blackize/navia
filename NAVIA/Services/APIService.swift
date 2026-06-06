import Foundation

class APIService {
    static let shared = APIService()
    private init() {}
    
    private let baseURL = "https://api.navia.app"
    
    func login(email: String, password: String) async throws -> User {
        let endpoint = "\(baseURL)/auth/login"
        print("Calling: \(endpoint) with email: \(email)")
        return User(id: "1", email: email, subscriptionStatus: .active)
    }
    
    func register(email: String, password: String) async throws -> User {
        let endpoint = "\(baseURL)/auth/register"
        print("Calling: \(endpoint)")
        return User(id: "1", email: email, subscriptionStatus: .active)
    }
    
    func getProfile(userId: String) async throws -> User {
        let endpoint = "\(baseURL)/user/profile"
        print("Calling: \(endpoint)")
        return User(id: userId, email: "user@example.com", subscriptionStatus: .active)
    }
    
    func getCareerPaths() async throws -> [CareerPath] {
        let endpoint = "\(baseURL)/paths"
        print("Calling: \(endpoint)")
        return []
    }
    
    func getRecommendations(interest: String, experience: String, goal: String, time: Int) async throws -> [CareerPath] {
        let endpoint = "\(baseURL)/recommendation"
        print("Calling: \(endpoint)")
        return []
    }
}