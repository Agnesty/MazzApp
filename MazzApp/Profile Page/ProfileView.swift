//
//  ProfileView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 27/07/25.
//

import SwiftUI
import RealmSwift

struct ProfileView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    
    private let userRepo = UserRepository()
    
    @State private var username: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: - Profile Header
                HStack(spacing: 16) {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .padding(14)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(username.isEmpty ? "Your Name" : username)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(email.isEmpty ? "Your Email" : email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ProfileDetailView()) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                
                // MARK: - Address & Security
                VStack(alignment: .leading, spacing: 0) {
                    Text("ADDRESS & SECURITY")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    
                    VStack(spacing: 0) {
                        ProfileOptionRow(icon: "mappin.and.ellipse", title: "Saved Addresses")
                        Divider()
                        ProfileOptionRow(icon: "key.fill", title: "Change Password")
                        Divider()
                        ProfileOptionRow(icon: "lock.fill", title: "Change Pin")
                        Divider()
                        ProfileOptionRow(icon: "faceid", title: "Enable Biometrics", hasToggle: true)
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                }
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarTitle("My Profile", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    isLoggedIn = false
                    loggedInEmail = ""
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.red)
                }
            )
            .onAppear {
                if let user = userRepo.fetchUser(byEmail: loggedInEmail) {
                    username = user.username
                    email = user.email
                } else {
                    print("⚠️ No user found for email: \(loggedInEmail)")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
