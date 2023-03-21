//
//  MusicViewModel.swift
//  SwiftUI-MVVM-Test
//
//  Created by Doyeon on 2023/03/21.
//

import SwiftUI
import AVFoundation
import MediaPlayer

// MARK: - private enum
fileprivate enum MessageKey: String {
    case play = "player"
    case volume = "volume"
    case title = "title"
}

class MusicViewModel: ObservableObject {
    // TODO: delegate 디자인 패턴을 이용한 ViewModel 만들어보기
    
    // MARK: - @Published properties
    @Published var currentTitle = ""
//     @Published var mixedSound: MixedSound? {
//        didSet {
//            // TODO: MixedSound Setting
//        }
//     }
    @Published var isPlaying: Bool = true {
        didSet {
            // TODO: MixedSound Setting
        }
    }
    
    // MARK: - Methods
    
}
