import SwiftUI

struct ProfileView: View {
    @State private var user: User?
    @State private var showingSubscription = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.system(size: 50))
                        VStack(alignment: .leading) {
                            Text(user?.email ?? "Loading...")
                                .font(.headline)
                            Text("Subscription: \(user?.subscriptionStatus.rawValue ?? "")")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Section("Account") {
                    Button("Edit Profile") { }
                    Button("Change Password") { }
                }
                
                Section("Subscription") {
                    Button("Manage Subscription") {
                        showingSubscription = true
                    }
                    Button("Restore Purchase") {
                        restorePurchases()
                    }
                }
                
                Section("Support") {
                    Button("Help & Support") { }
                    Button("Log Out") { }
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Profile")
            .onAppear { user = mockUser() }
            .sheet(isPresented: $showingSubscription) {
                SubscriptionView()
            }
        }
    }
    
    private func mockUser() -> User {
        User(id: "1", email: "user@example.com", subscriptionStatus: .active)
    }
    
    private func restorePurchases() {
        print("Restoring purchases...")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}