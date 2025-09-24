//
//  VideoPlayerContainer.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 24/09/25.
//

import Foundation
import SwiftUI
import AVKit

struct VideoPlayerContainer: View {
    let url: URL
    @State private var player: AVPlayer?

    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayerView(player: player)
                    .onAppear {
                        player.play()
                        player.actionAtItemEnd = .none
                        NotificationCenter.default.addObserver(
                            forName: .AVPlayerItemDidPlayToEndTime,
                            object: player.currentItem,
                            queue: .main
                        ) { _ in
                            player.seek(to: .zero)
                            player.play()
                        }
                    }
                    .onDisappear {
                        player.pause()
                    }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            player = AVPlayer(url: url)
        }
    }
}
