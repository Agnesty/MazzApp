//
//  SignInView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Judul besar di tengah
                Text("SignIn")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
            }
            .navigationBarHidden(true)
            .background(Color(.systemBackground))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
