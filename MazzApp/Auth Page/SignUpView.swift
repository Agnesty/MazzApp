//
//  SignUpView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Create your new account")
                .foregroundColor(.gray)
            
            AuthCustomTextField(title: "Full Name", systemImage: "person.fill", text: $fullname)
            AuthCustomTextField(title: "Username", systemImage: "person.fill", text: $username)
            AuthCustomTextField(title: "Email", systemImage: "envelope.fill", text: $email)
            AuthCustomTextField(title: "Password", systemImage: "lock.fill", text: $password, isSecure: true)
            AuthCustomTextField(title: "Confirm Password", systemImage: "lock.rotation", text: $confirmPassword, isSecure: true)
            
            Button(action: {
                print("Sign Up tapped")
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(12)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

