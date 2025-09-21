//
//  BannerCarouselView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct BannerCarouselView: View {
    @State private var currentIndex = 0
    @State private var progress: CGFloat = 0.0
    
    let banners: [Banners]
    let timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(banners.indices, id: \.self) { index in
                    KFImage(URL(string: banners[index].imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            
            HStack(spacing: 6) {
                ForEach(banners.indices, id: \.self) { index in
                    if index == currentIndex {
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.white.opacity(0.5))
                                .frame(width: 24, height: 6)
                            
                            Capsule()
                                .fill(Color.blue)
                                .frame(width: 24 * progress, height: 6)
                                .animation(.linear(duration: 0.02), value: progress)
                        }
                    } else {
                        Circle()
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 6, height: 6)
                    }
                }
            }
            .padding(.bottom, 10)
        }
        .frame(height: 200)
        .onReceive(timer) { _ in
            guard !banners.isEmpty else { return }
            
            if progress < 1.0 {
                progress += 0.01 / 3.0 * CGFloat(banners.count)
            } else {
                progress = 0.0
                withAnimation {
                    currentIndex = (currentIndex + 1) % banners.count
                }
            }
        }
        .onChange(of: currentIndex) { _, _ in
            progress = 0.0
        }
    }
}

//struct BannerCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        let sampleBanners = [
//            Banners(id: 1, imageUrl: "https://images.unsplash.com/photo-1523275335684-37898b6baf30"),
//            Banners(id: 2, imageUrl: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"),
//            Banners(id: 3, imageUrl: "https://images.unsplash.com/photo-1491553895911-0055eca6402d")
//        ]
//        
//        BannerCarouselView(banners: sampleBanners)
//            .previewLayout(.sizeThatFits)
//    }
//}

