//
//  AudioManager.swift
//  SwiftUI-MVVM-Test
//
//  Created by Doyeon on 2023/03/21.
//

import Foundation
import AVFoundation

final class AudioManager {
    var player: AVAudioPlayer?
    
    private enum MusicExtension: String {
        case mp3 = "mp3"
    }
    
    private func getPathUrl(forResource: String, musicExtension: MusicExtension) -> URL? {
        Bundle.main.url(forResource: forResource, withExtension: musicExtension.rawValue) ?? nil
    }
    
    func startPlayer(track: String, volume: Float? = 1.0) {
        guard let url = getPathUrl(forResource: track, musicExtension: .mp3),
              let volume = volume else {
            self.player = nil
            print("resource not found \(track)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = volume
            player?.numberOfLoops -= 1
            player?.play()
        } catch {
            print("fail to initialize player")
        }
    }
}
