import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedLesson: Lesson?
    @State private var lessonPathId: String?
    @State private var selectedCourse: CareerPath?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Continue Learning")
                        .font(.headline)
                    
                    if let lastLesson = viewModel.lastWatchedLesson {
                        LessonRow(lesson: lastLesson)
                            .onTapGesture { 
                                selectedLesson = lastLesson
                                lessonPathId = viewModel.recommendedPath?.id
                            }
                    }
                    
                    Text("Your AI Career Path")
                        .font(.headline)
                    
                    if let path = viewModel.recommendedPath {
                        NavigationLink(destination: CourseDetailView(course: path)) {
                            CareerPathCard(path: path)
                        }
                    }
                    
                    Text("Explore Paths")
                        .font(.headline)
                    
                    ForEach(viewModel.alternativePaths) { path in
                        NavigationLink(destination: CourseDetailView(course: path)) {
                            CareerPathCard(path: path)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("NAVIA")
            .sheet(item: $selectedLesson) { lesson in
                if let pathId = lessonPathId {
                    LessonPlayerView(lesson: lesson, pathId: pathId)
                }
            }
        }
    }
}

struct LessonRow: View {
    var lesson: Lesson
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(lesson.title)
                    .font(.subheadline)
                Text("Module")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "play.circle.fill")
                .font(.largeTitle)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct CareerPathCard: View {
    var path: CareerPath
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(path.title)
                .font(.headline)
            Text(path.outcome)
                .font(.subheadline)
                .foregroundColor(.secondary)
            ProgressView(value: path.progress)
                .progressViewStyle(LinearProgressViewStyle())
            Text("\(Int(path.progress * 100))% complete")
                .font(.caption)
                .foregroundColor(.secondary)
            Button("Continue") { }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}