//
//  NotificationView.swift
//  MazzApp
//
//  Created by Phincon on 27/07/25.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Judul besar di tengah
                Text("Notification")
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

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
