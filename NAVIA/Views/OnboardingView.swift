import SwiftUI

struct OnboardingView: View {
    var onboardingCompleted: () -> Void
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var step = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step \(step) of 4")
                .font(.caption)
                .foregroundColor(.secondary)
            
            switch step {
            case 1:
                SelectionView(
                    title: "What interests you?",
                    options: Interest.allCases.map { $0.rawValue },
                    selection: $viewModel.selectedInterestRaw
                )
            case 2:
                SelectionView(
                    title: "Your experience level?",
                    options: ExperienceLevel.allCases.map { $0.rawValue },
                    selection: $viewModel.selectedExperienceRaw
                )
            case 3:
                SelectionView(
                    title: "What's your goal?",
                    options: Goal.allCases.map { $0.rawValue },
                    selection: $viewModel.selectedGoalRaw
                )
            case 4:
                SelectionView(
                    title: "Time availability?",
                    options: TimeAvailability.allCases.map { $0.displayText },
                    selection: $viewModel.selectedTimeRaw
                )
            default:
                EmptyView()
            }
            
            Spacer()
            
            Button(action: nextStep) {
                Text(step == 4 ? "Get My Career Plan" : "Continue")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!canProceed)
        }
        .padding()
    }
    
    private var canProceed: Bool {
        switch step {
        case 1: return viewModel.selectedInterestRaw != nil
        case 2: return viewModel.selectedExperienceRaw != nil
        case 3: return viewModel.selectedGoalRaw != nil
        case 4: return viewModel.selectedTimeRaw != nil
        default: return false
        }
    }
    
    private func nextStep() {
        if step < 4 {
            step += 1
        } else {
            completeOnboarding()
        }
    }
    
    private func completeOnboarding() {
        print("Onboarding completed!")
        onboardingCompleted()
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