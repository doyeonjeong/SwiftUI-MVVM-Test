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
}
