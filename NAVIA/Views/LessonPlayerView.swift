import SwiftUI
import WebKit

struct WKWebViewContainer: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct LessonPlayerView: View {
    var lesson: Lesson
    var pathId: String
    @State private var isCompleted = false
    
    var body: some View {
        VStack {
            if let embedURL = lesson.embedURL {
                WKWebViewContainer(url: embedURL)
                    .frame(height: 250)
            } else {
                PlaceholderView()
                    .frame(height: 250)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text(lesson.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(lesson.duration)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Button("Mark as Complete") {
                    isCompleted = true
                    ProgressService.shared.updateProgress(
                        pathId: pathId,
                        lessonId: lesson.id,
                        completionPercent: 100
                    )
                }
                .buttonStyle(.borderedProminent)
                .disabled(isCompleted)
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlaceholderView: View {
    var body: some View {
        Color.gray.opacity(0.3)
            .overlay(Image(systemName: "video"))
    }
}