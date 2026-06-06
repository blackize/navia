import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedCategory: Category?
    
    enum Category: String, CaseIterable {
        case all = "All"
        case careers = "Careers"
        case lessons = "Lessons"
        case modules = "Modules"
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.id) { result in
                    SearchResultRow(result: result)
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText)
            .pickerStyle(SegmentedPickerStyle())
            .onAppear {
                setupCategories()
            }
        }
    }
    
    private var searchResults: [SearchResult] {
        guard !searchText.isEmpty else { return [] }
        return [
            SearchResult(id: "1", title: "Frontend Developer", subtitle: "Career Path", type: .career),
            SearchResult(id: "2", title: "HTML Basics", subtitle: "Lesson", type: .lesson),
            SearchResult(id: "3", title: "JavaScript", subtitle: "Module", type: .module),
        ].filter { result in
            result.title.localizedCaseInsensitiveContains(searchText) ||
            result.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private func setupCategories() {
        selectedCategory = .all
    }
}

enum ResultType {
    case career
    case lesson
    case module
}

struct SearchResult: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let type: ResultType
}

struct SearchResultRow: View {
    var result: SearchResult
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(result.title)
                    .font(.subheadline)
                Text(result.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: result.type == .career ? "briefcase" : result.type == .lesson ? "play.circle" : "list.bullet")
                .foregroundColor(.blue)
        }
        .padding(.vertical, 8)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}