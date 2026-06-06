import SwiftUI

struct AppleSignInButton: View {
    var onSuccess: (User) -> Void
    
    var body: some View {
        Button(action: {
            // Simulate Apple Sign-In for now
            let mockUser = User(id: "apple_123", email: "user@apple.com", subscriptionStatus: .inactive)
            onSuccess(mockUser)
        }) {
            HStack {
                Image(systemName: "applelogo")
                Text("Sign in with Apple")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct AppleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignInButton(onSuccess: { _ in })
    }
}