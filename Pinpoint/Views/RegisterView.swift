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
            VStack/*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/

            // Give option to log-in if they already have an account
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
