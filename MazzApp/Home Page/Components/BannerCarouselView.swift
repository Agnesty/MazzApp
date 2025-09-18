//
//  BannerCarouselView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation
import SwiftUI

struct BannerCarouselView: View {
    @State private var currentIndex = 0
    @State private var progress: CGFloat = 0
    
    let banners: [Color] = [.red, .blue, .green, .orange]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<banners.count, id: \.self) { index in
                banners[index]
                    .overlay(
                        VStack {
                            Spacer()
                            
                            // MARK: - Custom Indicator (inside banner)
                            HStack(spacing: 8) {
                                ForEach(0..<banners.count, id: \.self) { i in
                                    ZStack(alignment: .leading) {
                                        Capsule()
                                            .fill(Color.white.opacity(0.3))
                                            .frame(width: 30, height: 6)
                                        
                                        if i == currentIndex {
                                            Capsule()
                                                .fill(Color.white)
                                                .frame(width: 30 * progress, height: 6)
                                                .id(currentIndex) // 🔑 force redraw tiap slide
                                        }
                                    }
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    )
                    .tag(index)
            }
        }
        .frame(height: 180)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onAppear {
            startProgressAnimation()
        }
        .onChange(of: currentIndex) { _ in
            startProgressAnimation()
        }
        .onReceive(timer) { _ in
            currentIndex = (currentIndex + 1) % banners.count
        }
    }
    
    private func startProgressAnimation() {
        progress = 0
        DispatchQueue.main.async {
            withAnimation(.linear(duration: 3)) {
                progress = 1
            }
        }
    }
}

struct BannerCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        BannerCarouselView()
    }
}
