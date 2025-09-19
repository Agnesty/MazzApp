//
//  ProfileDetailView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import Foundation
import SwiftUI

struct ProfileDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var fullname: String = "Agnes Triselia Yudia"
    @State private var username: String = "Agnesty"
    @State private var email: String = "agnes@example.com"
    @State private var mobile: String = "+62 812-3456-7890"
    @State private var location: String = "Indonesia"
    
    var body: some View {
        VStack(spacing: 24) {
            
            // MARK: - Avatar with Edit Button
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
            
            // MARK: - Form Fields
            VStack(spacing: 16) {
                ProfileCustomTextField(title: "Full Name", text: $fullname)
                ProfileCustomTextField(title: "Username", text: $username)
                ProfileCustomTextField(title: "E-Mail", text: $email, keyboardType: .emailAddress)
                ProfileCustomTextField(title: "Phone Mobile", text: $mobile, keyboardType: .phonePad)
                ProfileCustomTextField(title: "Location", text: $location)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - Save Button
            Button(action: {
                print("Save tapped")
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
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileDetailView()
        }
    }
}
