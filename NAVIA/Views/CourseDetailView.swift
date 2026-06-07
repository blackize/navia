import SwiftUI

struct CourseDetailView: View {
    var course: CareerPath
    @State private var selectedLesson: Lesson?
    @State private var lessonPathId: String?
    
    var body: some View {
        Group {
            if let selectedLesson = selectedLesson, let lessonPathId = lessonPathId {
                LessonPlayerView(lesson: selectedLesson, pathId: lessonPathId)
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(course.title)
                            .font(.largeTitle)
                            .bold()
                        
                        Text(course.outcome)
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        Text(course.description)
                            .font(.body)
                        
                        HStack {
                            Text(course.duration)
                                .font(.subheadline)
                            Text(course.difficulty)
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)
                        
                        Text("Modules (\(course.modules.count))")
                            .font(.headline)
                            .padding(.top)
                        
                        ForEach(course.modules) { module in
                            ModuleView(module: module) { lesson in
                                selectedLesson = lesson
                                lessonPathId = course.id
                            }
                            Divider()
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            print("DEBUG: CourseDetailView appeared, modules=\(course.modules.count)")
        }
    }
}

struct ModuleView: View {
    var module: Module
    var onSelectLesson: (Lesson) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(module.title)
                .font(.headline)
            
            ForEach(module.lessons) { lesson in
                HStack {
                    Image(systemName: lesson.isCompleted ? "checkmark.circle.fill" : "play.circle")
                        .foregroundColor(lesson.isCompleted ? .green : .blue)
                    Text(lesson.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(lesson.duration)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
                .onTapGesture {
                    onSelectLesson(lesson)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.vertical, 4)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseDetailView(course: CareerPath(
                id: "1",
                title: "Test Course",
                description: "Test description",
                modules: [],
                duration: "8 weeks",
                difficulty: "Beginner",
                outcome: "Become Expert"
            ))
        }
    }
}