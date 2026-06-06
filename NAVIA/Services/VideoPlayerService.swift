import Foundation
import SwiftUI
import AVKit
import Combine

class VideoPlayerService: NSObject, ObservableObject {
    @Published var player: AVPlayer?
    @Published var isPlaying = false
    @Published var currentTime = 0.0
    @Published var duration = 0.0
    
    func loadVideo(url: String) {
        guard let videoURL = URL(string: url) else { return }
        player = AVPlayer(url: videoURL)
        setupObservables()
    }
    
    func play() {
        player?.play()
        isPlaying = true
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
    func seek(to time: Double) {
        let tolerance = CMTimeMake(value: 0, timescale: 1)
        player?.seek(to: CMTimeMake(value: Int64(time), timescale: 1), toleranceBefore: tolerance, toleranceAfter: tolerance)
    }
    
    func setPlaybackSpeed(_ speed: Float) {
        player?.rate = speed
    }
    
    private func setupObservables() {
        player?.addObserver(self, forKeyPath: "timeControlStatus", options: [.new, .old], context: nil)
        player?.addObserver(self, forKeyPath: "currentItem?.duration", options: [.new], context: nil)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.currentTime = self.player?.currentTime().seconds ?? 0
        }
    }
    
    override func observeValue(forKeyPath path: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if path == "currentItem?.duration" {
            duration = player?.currentItem?.duration.seconds ?? 0
        }
    }
}