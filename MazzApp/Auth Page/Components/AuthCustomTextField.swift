//
//  CustomTextField.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 19/09/25.
//

import SwiftUI

// MARK: - Reusable AuthCustomTextField
struct AuthCustomTextField: View {
    var title: String
    var systemImage: String
    @Binding var text: String
    var isSecure: Bool = false
    
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                if isSecure {
                    if isPasswordVisible {
                        TextField("Enter \(title)", text: $text)
                    } else {
                        SecureField("Enter \(title)", text: $text)
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                } else {
                    TextField("Enter \(title)", text: $text)
                        .autocapitalization(.none)
                }
                
                Image(systemName: systemImage)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
        }
    }
}
