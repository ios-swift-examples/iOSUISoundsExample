//
//  ContentView.swift
//  iOSUISoundsExample
//
//  Created by 영준 이 on 2023/12/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                List(viewModel.sounds, id: \.relativePath) { sound in
                    HStack {
                        Text(sound.lastPathComponent)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .listRowBackground(viewModel.selectedSound?.relativePath == sound.relativePath ? Color.cyan.opacity(0.5) : Color.clear)
                    .onTapGesture {
                        viewModel.select(sound)
                    }
                    
                }
                .padding()
                Button("Play") {
                    viewModel.play()
                }
            }
            .onAppear {
                Task{
                    viewModel.loadSounds()
                }
            }.navigationTitle("UISounds")
        }
        
    }
}

#Preview {
    ContentView()
}
