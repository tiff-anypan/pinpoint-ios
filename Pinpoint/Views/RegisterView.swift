//
//  RegisterView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                HeaderView(headerText: "Hello,",
                           subheaderText: "first time around here?")
                .padding(.leading)
                
                
                
                Spacer()
                
                // Enter credentials
                Form {
                    Group {
                        TextField("Full Name", text:$viewModel.fullName)
                            .textInputAutocapitalization(.words)
                        TextField("Email", text:$viewModel.email)
                            .textInputAutocapitalization(.never)
                        
                        // TODO: Some toggle for the field to not be secure
                        SecureField("Password", text: $viewModel.password)
                            .padding(.bottom)
                    }
                    .textFieldStyle(.plain)
                    .autocorrectionDisabled()
                    .listRowSeparator(.hidden)
                    
                    RoundedButtonView(title: "Register", backgroundColor: fieldsFilled() ? .green : .gray
                    ) {
                        if fieldsFilled() {
                            viewModel.register()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(height: 300)
                
                Spacer()
                
            }

            // Give option to log-in if they already have an account
            // TODO: Factor these fonts out into a Constants
            VStack {
                Text("Already have an account?")
                    .font(.system(size: 14, weight: .regular, design:.rounded))
                    .padding(.bottom, 1)
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Login instead.")
                        .font(.system(size: 11, weight: .regular, design:.rounded))
                }
                .navigationBarBackButtonHidden(true)
            }
            
        }
    }
    
    /// Checks whether or not all fields are filled correctly
    private func fieldsFilled() -> Bool {
        // TODO: Probably also indicate any specific rules we want for these fields, i.e. passwords to be a certain length etc.
        // Also display those requirements somewhere
        
        if !viewModel.fullName.isEmpty, !viewModel.email.isEmpty, !viewModel.password.isEmpty {
            return true
        }
        return false
    }
}

#Preview {
    RegisterView()
}
