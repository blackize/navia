import SwiftUI

struct SubscriptionView: View {
    @State private var selectedPlan = "monthly"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("NAVIA All Access")
                .font(.title)
                .bold()
            
            Text("Unlimited access to all career paths")
                .font(.headline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 12) {
                PlanCard(title: "Monthly", price: "$9.99/mo", isSelected: selectedPlan == "monthly")
                    .onTapGesture { selectedPlan = "monthly" }
                
                PlanCard(title: "Yearly", price: "$79.99/year", isSelected: selectedPlan == "yearly")
                    .onTapGesture { selectedPlan = "yearly" }
            }
            
            Button("Subscribe") {
                startSubscription()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Restore Purchase") {
                restorePurchases()
            }
            .foregroundColor(.secondary)
        }
        .padding()
    }
    
    private func startSubscription() {
        print("Starting subscription: \(selectedPlan)")
    }
    
    private func restorePurchases() {
        print("Restoring purchases")
    }
}

struct PlanCard: View {
    var title: String
    var price: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(price)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(isSelected ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}