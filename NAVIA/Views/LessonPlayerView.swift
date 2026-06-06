import SwiftUI
import AVKit

struct LessonPlayerView: View {
    var lesson: Lesson
    var pathId: String
    @StateObject private var playerService = VideoPlayerService()
    @State private var playbackSpeed: Float = 1.0
    @State private var showingSettings = false
    @State private var isCompleted = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VideoPlayer(player: playerService.player)
                    .onAppear {
                        playerService.loadVideo(url: lesson.videoURL)
                        playerService.play()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16)
                
                VStack(spacing: 12) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(lesson.title)
                                .font(.headline)
                            Text("Module")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Button { showingSettings = true } label: {
                            Image(systemName: "gearshape")
                        }
                    }
                    
                    HStack {
                        Text("\(formatTime(playerService.currentTime)) / \(formatTime(playerService.duration))")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        ProgressView(value: playerService.currentTime, total: playerService.duration)
                            .frame(width: 100)
                    }
                    
                    HStack {
                        Button {
                            playerService.seek(to: max(0, playerService.currentTime - 30))
                        } label: {
                            Image(systemName: "gobackward")
                        }
                        Button {
                            playerService.isPlaying ? playerService.pause() : playerService.play()
                        } label: {
                            Image(systemName: playerService.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.title)
                        }
                        Button {
                            playerService.seek(to: min(playerService.duration, playerService.currentTime + 30))
                        } label: {
                            Image(systemName: "goforward")
                        }
                        Spacer()
                        Button {
                            playerService.setPlaybackSpeed(playbackSpeed == 1.0 ? 1.5 : playbackSpeed == 1.5 ? 2.0 : 1.0)
                        } label: {
                            Text("\(playbackSpeed)x")
                                .font(.subheadline)
                                .frame(width: 50)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                    .font(.title2)
                    
                    Button(isCompleted ? "Completed" : "Mark as Complete") {
                        markLessonComplete()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(isCompleted)
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView(playbackSpeed: $playbackSpeed)
        }
        .onDisappear {
            ProgressService.shared.setLastWatchedLesson(lesson.id, pathId: pathId)
        }
    }
    
    private func markLessonComplete() {
        isCompleted = true
        ProgressService.shared.updateProgress(
            pathId: pathId,
            lessonId: lesson.id,
            completionPercent: 100
        )
    }
    
    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

struct SettingsView: View {
    @Binding var playbackSpeed: Float
    var body: some View {
        NavigationView {
            Form {
                Section("Playback Speed") {
                    Picker("Speed", selection: $playbackSpeed) {
                        Text("0.5x").tag(0.5)
                        Text("1.0x").tag(1.0)
                        Text("1.5x").tag(1.5)
                        Text("2.0x").tag(2.0)
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct LessonPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        LessonPlayerView(lesson: Lesson(id: "1", title: "Test Lesson", videoURL: "https://example.com/video.mp4", duration: "10 min"), pathId: "1")
    }
}