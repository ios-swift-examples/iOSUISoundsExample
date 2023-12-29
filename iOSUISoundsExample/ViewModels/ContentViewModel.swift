//
//  ContentViewModel.swift
//  iOSUISoundsExample
//
//  Created by 영준 이 on 2023/12/28.
//

import Foundation
import AVFoundation

class ContentViewModel: ObservableObject, SoundsContainable {
    static let soundsRoot = URL(fileURLWithPath: "/System/Library/Audio/UISounds")
//    static let soundsRoot = URL(fileURLWithPath: "/System/Library/Audio")
//    static let soundsRoot = URL(fileURLWithPath: "/System/Library/Audio/MIDI Devices/Generic")
    
    @Published private(set) var sounds: [UISoundModel] = []
    @Published var selectedSound: UISoundModel? {
        didSet {
            play()
        }
    }
    
    private var player: AVAudioPlayer?
    
    func loadSounds() {
        //load frrom soundsRoot
        self.sounds = try! FileManager.default
            .contentsOfDirectory(at: type(of: self).soundsRoot,
                                 includingPropertiesForKeys: nil,
                                 options: [
                                    .skipsSubdirectoryDescendants,
                                    .skipsPackageDescendants,
                                    .skipsHiddenFiles])
            .filter{ !$0.isDirectory() }
    }
    
    func select(_ sound: UISoundModel) {
        selectedSound = sound
    }
    
    func play() {
        guard let selectedSound else {
            return
        }
        
        player = try! .init(contentsOf: selectedSound)
//        player?.prepareToPlay()
        player?.play()
    }
}
