import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var showOnboarding = true
    
    var body: some View {
        NavigationView {
            if showOnboarding {
                OnboardingView()
            } else {
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}