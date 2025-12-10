//
//  BottomSheetView.swift
//  MazzApp
//
//  Created by 2171 on 06/12/25.
//

import SwiftUI

struct NewBottomSheetView: View {
    let title: String
    let message: String
    let yesTitle: String
    let imgDrawer: UIImage
    let onConfirmed: (Bool) -> Void
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {

            // Close Button
            HStack {
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .padding(8)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)

            // Image
            if imgDrawer.size.width > 0 {
                Image(uiImage: imgDrawer)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
            }

            // Title
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)

            // Message
            Text(message)
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

            // Button
            Button {
                isPresented = false
                onConfirmed(true)
            } label: {
                Text(yesTitle)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(26)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)

        }
        .padding(.top, 10)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .edgesIgnoringSafeArea(.bottom)  
    }
}
