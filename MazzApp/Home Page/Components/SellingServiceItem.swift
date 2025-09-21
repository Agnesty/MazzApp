//
//  SellingServiceItem.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import SwiftUI
import Kingfisher

struct SellingServiceItem: View {
    var title: String
    var imageUrl: String
    
    var body: some View {
        VStack(spacing: 8) {
            KFImage(URL(string: imageUrl))
                .resizable()
                .placeholder {
                    ProgressView()
                }
                .cancelOnDisappear(true)
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .frame(width: 70, height: 32)
        }
    }
}

