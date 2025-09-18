//
//  UserCardItem.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation
import SwiftUI

struct UserCardItem: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.brown)
                .frame(width: 10, height: 10)
                .padding(.trailing, 2)
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)
                .lineLimit(1)
        }
        .padding()
        .background(Color.brown.opacity(0.2))
        .cornerRadius(12)
    }
}
