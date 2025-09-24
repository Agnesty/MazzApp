//
//  LiveView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 27/07/25.
//

import SwiftUI
import AVKit
import Kingfisher

struct LiveView: View {
    @StateObject private var viewModel = LiveViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Loading videos...")
            } else if let error = viewModel.errorMessage {
                Text("❌ \(error)")
            } else {
                TabView {
                    ForEach(viewModel.videos) { video in
                        if let urlString = video.videoFiles.first?.link,
                           let url = URL(string: urlString) {
                            ZStack {
                                VideoPlayerContainer(url: url)
                                    .ignoresSafeArea()
                                
                                HStack(alignment: .bottom) {
                                    
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Cup of Couple")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text("This is a caption label")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        
                                        HStack(spacing: 6) {
                                            Image(systemName: "music.note")
                                                .foregroundColor(.white)
                                            Text("Music Music Music")
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.leading, 16)
                                    .padding(.bottom, 20)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    VStack(spacing: 24) {
                                        Spacer()
                                        
                                        KFImage(URL(string: video.image))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 45, height: 45)
                                            .clipShape(Circle())
                                        
                                        VStack {
                                            Image(systemName: "heart.fill")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.white)
                                            Text("678")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack {
                                            Image(systemName: "message.fill")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.white)
                                            Text("678")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        
                                        VStack {
                                            Image(systemName: "arrowshape.turn.up.right.fill")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.white)
                                            Text("678")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.trailing, 8)
                                    .frame(maxHeight: .infinity, alignment: .center)
                                }
                            }
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .onAppear {
            viewModel.fetchVideos()
        }
    }
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}



