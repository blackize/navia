import SwiftUI

struct OnboardingView: View {
    var onboardingCompleted: () -> Void
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var step = 1
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step \(step) of 6")
                .font(.caption)
                .foregroundColor(.secondary)
            
            switch step {
            case 1:
                AuthInputView(
                    title: "Welcome to NAVIA",
                    subtitle: "Sign in to continue",
                    email: $email,
                    password: $password
                )
                Text("or")
                    .foregroundColor(.secondary)
                AppleSignInButton(onSuccess: { user in
                    print("Apple Sign-In: \(user.email)")
                })
            case 2:
                SelectionView(
                    title: "What interests you?",
                    options: Interest.allCases.map { $0.rawValue },
                    selection: $viewModel.selectedInterestRaw
                )
            case 3:
                SelectionView(
                    title: "Your experience level?",
                    options: ExperienceLevel.allCases.map { $0.rawValue },
                    selection: $viewModel.selectedExperienceRaw
                )
            case 4:
                SelectionView(
                    title: "What's your goal?",
                    options: Goal.allCases.map { $0.rawValue },
                    selection: $viewModel.selectedGoalRaw
                )
            case 5:
                SelectionView(
                    title: "Time availability?",
                    options: TimeAvailability.allCases.map { $0.displayText },
                    selection: $viewModel.selectedTimeRaw
                )
            case 6:
                ResultView()
            default:
                EmptyView()
            }
            
            Spacer()
            
            Button(action: nextStep) {
                Text(step == 6 ? "Get My Career Plan" : "Continue")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!canProceed)
        }
        .padding()
    }
    
    private var canProceed: Bool {
        switch step {
        case 1: return !email.isEmpty && !password.isEmpty
        case 2: return viewModel.selectedInterestRaw != nil
        case 3: return viewModel.selectedExperienceRaw != nil
        case 4: return viewModel.selectedGoalRaw != nil
        case 5: return viewModel.selectedTimeRaw != nil
        case 6: return true
        default: return false
        }
    }
    
    private func nextStep() {
        if step < 6 {
            step += 1
        } else {
            completeOnboarding()
        }
    }
    
    private func completeOnboarding() {
        onboardingCompleted()
    }
}

struct AuthInputView: View {
    var title: String
    var subtitle: String
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title)
                .bold()
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Sign In") { }
                .buttonStyle(.borderedProminent)
        }
    }
}

struct ResultView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.text.square")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            Text("Your AI Career Plan")
                .font(.title)
            Text("NAVIA will recommend the best career path for you")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
    }
}

struct SelectionView: View {
    var title: String
    var options: [String]
    @Binding var selection: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title2)
                .bold()
            
            ForEach(options, id: \.self) { option in
                Button(action: { selection = option }) {
                    Text(option)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(selection == option ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingCompleted: {})
    }
}