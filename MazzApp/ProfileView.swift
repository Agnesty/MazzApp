//
//  ProfileView.swift
//  MazzApp
//
//  Created by Phincon on 27/07/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Judul besar di tengah
                Text("Profile")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
