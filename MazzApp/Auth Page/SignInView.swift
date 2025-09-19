//
//  SignInView.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 18/09/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var keepSignedIn = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                
                // Title
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Let’s sign in with your account")
                        .foregroundColor(.gray)
                }
                
                // Email
                AuthCustomTextField(title: "Email", systemImage: "envelope.fill", text: $email)
                
                // Password
                AuthCustomTextField(title: "Password", systemImage: "lock.fill", text: $password, isSecure: true)
                
                // Forgot password
                HStack {
                    Spacer()
                    
                    Button("Forgot password?") {
                        print("Forgot tapped")
                    }
                    .font(.footnote)
                    .foregroundColor(.purple)
                }
                
                // Sign In Button
                Button(action: {
                    isLoggedIn = true
                    print("Sign In tapped")
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(12)
                }
                
                // Or sign in with Google
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                    Text("Or, sign in with")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                }
                
                Button(action: {
                    print("Google Sign In tapped")
                }) {
                    HStack {
                        Image(systemName: "g.circle.fill")
                            .foregroundColor(.red)
                        Text("Sign in with Google")
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
                }
                
                // Link ke Sign Up
                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 8)
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6).ignoresSafeArea())
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
