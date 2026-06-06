import Foundation

class SubscriptionService {
    static let shared = SubscriptionService()
    private init() {}
    
    func purchaseSubscription(plan: String) async throws -> Bool {
        print("Purchasing: \(plan)")
        return true
    }
    
    func restorePurchases() async throws -> Bool {
        print("Restoring purchases")
        return true
    }
    
    func checkSubscription() -> Bool {
        return true
    }
}