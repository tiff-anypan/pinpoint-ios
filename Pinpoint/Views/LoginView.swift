//
//  LoginView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                HeaderView(headerText: "Hello,",
                           subheaderText: "welcome back!")
                .padding(.leading)
                
                
                
                Spacer()
                
                // Enter credentials
                Form {
                    Group {
                        TextField("Email", text: $viewModel.email)
                        SecureField("Password", text: $viewModel.password)
                            .padding(.bottom)
                    }
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                    .listRowSeparator(.hidden)
                    
                    RoundedButtonView(title: "Login", backgroundColor: fieldsFilled() ? .blue : .gray
                    ) {
                        if fieldsFilled() {
                            viewModel.login()
                            
                            // MainView automatically pushes the PackageListView as long as its VM's isSignedField is no longer returning false
                        }
                    }
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                            .font(.system(size: 14, weight: .regular, design:.rounded))
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(height: 300)
                
                Spacer()
                
            }

            // Give option to log-in if they already have an account
            // TODO: Factor these fonts out into a Constants
            VStack {
                Text("New around here?")
                    .font(.system(size: 14, weight: .regular, design:.rounded))
                    .padding(.bottom, 1)
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Create an account.")
                        .font(.system(size: 11, weight: .regular, design:.rounded))
                }
                .navigationBarBackButtonHidden(true)
            }
            
        }
    }
    
    /// Checks whether or not all fields are filled correctly
    private func fieldsFilled() -> Bool {
        // TODO: Probably also indicate any specific rules we want for these fields, i.e. passwords to be a certain length etc.
        // Also display those requirements somewhere visible to the user
        
        if !viewModel.email.isEmpty, !viewModel.password.isEmpty {
            return true
        }
        
        return false
    }
}

#Preview {
    LoginView()
}
