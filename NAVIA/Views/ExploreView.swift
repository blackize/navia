import SwiftUI

struct ExploreView: View {
    @State private var paths: [CareerPath] = []
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(paths) { path in
                NavigationLink(destination: CareerPathDetailView(path: path)) {
                    VStack(alignment: .leading) {
                        Text(path.title)
                            .font(.headline)
                        Text(path.outcome)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("\(path.duration) • \(path.difficulty)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Explore")
            .searchable(text: $searchText)
            .onAppear { paths = mockPaths() }
        }
    }
    
    private func mockPaths() -> [CareerPath] {
        (1...11).map { i in
            CareerPath(
                id: "\(i)",
                title: ["Frontend Developer", "QA Engineer", "Python Developer", "DevOps Engineer", "Cybersecurity Specialist", "Data Analyst", "Flutter Developer", "Swift iOS Developer", "IT Project Manager", "Business Analyst", "Vibe Coding"][i-1],
                description: "Learn \(i) skills",
                modules: [],
                duration: "\(i) weeks",
                difficulty: ["Beginner", "Intermediate", "Advanced"][i % 3],
                outcome: "Become Expert #\(i)"
            )
        }
    }
}

struct CareerPathDetailView: View {
    var path: CareerPath
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(path.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(path.outcome)
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text(path.description)
                    .font(.body)
                
                Text("Duration: \(path.duration)")
                Text("Difficulty: \(path.difficulty)")
                
                Button("Start Learning") { }
                .buttonStyle(.borderedProminent)
                
                Text("Modules")
                    .font(.headline)
                
                ForEach(path.modules) { module in
                    Text(module.title)
                        .padding(.vertical, 4)
                }
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}