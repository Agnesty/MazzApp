//
//  ProfileCustomField.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 19/09/25.
//

import SwiftUI

// MARK: - Custom TextField
struct ProfileCustomTextField: View {
    var title: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            TextField("", text: $text)
                .keyboardType(keyboardType)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
        }
    }
}
