//
//  UISoundModel.swift
//  iOSUISoundsExample
//
//  Created by 영준 이 on 2023/12/28.
//

import Foundation

typealias UISoundModel = URL

protocol SoundsContainable {
    var sounds: [UISoundModel] { get }
    func loadSounds() async
}
