//
//  ProfileOptionRow.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 19/09/25.
//

import SwiftUI

// MARK: - Row Component
struct ProfileOptionRow: View {
    var icon: String
    var title: String
    var hasToggle: Bool = false
    
    @State private var isOn: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 24, height: 24)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            if hasToggle {
                Toggle("", isOn: $isOn)
                    .labelsHidden()
            } else {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
