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
    @State private var errorMessage: String?
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("loggedInEmail") var loggedInEmail: String = ""
    
    private let userRepo = UserRepository()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Let’s sign in with your account")
                        .foregroundColor(.gray)
                }
                
                AuthCustomTextField(title: "Email", systemImage: "envelope.fill", text: $email)
                AuthCustomTextField(title: "Password", systemImage: "lock.fill", text: $password, isSecure: true)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
                
                Button(action: {
                    if let user = userRepo.authenticateUser(email: email, password: password) {
                        loggedInEmail = user.email
                        isLoggedIn = true
                    } else {
                        errorMessage = "Invalid email or password"
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                
                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
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
