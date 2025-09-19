//
//  ProfileDetailView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import SwiftUI
import RealmSwift

struct ProfileDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    private let userRepo = UserRepository()
    
    @State private var fullname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var mobile: String = ""
    @State private var location: String = ""
    
    @State private var currentUser: User?
    @State private var statusMessage: String?
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            // Avatar
            ZStack(alignment: .bottomTrailing) {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 120, height: 120)
                    .overlay(
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .padding(24)
                    )
                
                Button {
                    print("Change profile picture tapped")
                } label: {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Circle().fill(Color.blue))
                }
                .offset(x: 8, y: 8)
            }
            .padding(.top, 20)
            
            // Form
            VStack(spacing: 16) {
                ProfileCustomTextField(title: "Full Name", text: $fullname)
                ProfileCustomTextField(title: "Username", text: $username)
                ProfileCustomTextField(title: "E-Mail", text: $email, keyboardType: .emailAddress)
                ProfileCustomTextField(title: "Phone Mobile", text: $mobile, keyboardType: .phonePad)
                ProfileCustomTextField(title: "Location", text: $location)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                if let user = currentUser {
                    do {
                        try userRepo.updateUser(user,
                                                fullname: fullname,
                                                username: username,
                                                mobile: mobile,
                                                location: location)
                        statusMessage = "✅ Profile berhasil disimpan"
                    } catch {
                        statusMessage = "❌ Gagal menyimpan profile: \(error.localizedDescription)"
                    }
                } else {
                    statusMessage = "❌ User tidak ditemukan"
                }
                showAlert = true
            }) {
                Text("SAVE")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(Color.blue))
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .navigationBarTitle("User Profile", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.gray)
        })
        .onAppear {
            if let user = userRepo.fetchUser(byEmail: loggedInEmail) {
                currentUser = user
                fullname = user.fullname
                username = user.username
                email = user.email
                mobile = user.mobile
                location = user.location
            } else {
                print("⚠️ No user found for email: \(loggedInEmail)")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Info"),
                  message: Text(statusMessage ?? "Terjadi kesalahan"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileDetailView()
        }
    }
}
