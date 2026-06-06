import Foundation

struct User: Codable, Identifiable {
    let id: String
    let email: String
    let subscriptionStatus: SubscriptionStatus
    
    enum SubscriptionStatus: String, Codable {
        case active = "active"
        case inactive = "inactive"
        case pending = "pending"
    }
}