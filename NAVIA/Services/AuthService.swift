import Foundation
import Combine

class AuthService: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func signIn(email: String, password: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let user = try await APIService.shared.login(email: email, password: password)
            self.user = user
            self.isAuthenticated = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func signUp(email: String, password: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let user = try await APIService.shared.register(email: email, password: password)
            self.user = user
            self.isAuthenticated = true
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func signOut() {
        user = nil
        isAuthenticated = false
    }
}