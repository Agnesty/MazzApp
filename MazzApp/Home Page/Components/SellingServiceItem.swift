//
//  SellingServiceItem.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation
import SwiftUI

struct SellingServiceItem: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(Color(.systemGray6))
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: image)
                        .font(.title2)
                        .foregroundColor(.blue)
                )
            
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .frame(width: 70, height: 32)
        }
    }
}
