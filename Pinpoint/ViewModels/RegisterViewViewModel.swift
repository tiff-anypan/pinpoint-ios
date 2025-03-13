//
//  RegisterViewModel.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {
        // TODO: Fetch an existing user here?
    }
    
    func register() {
        // TODO: Register a new user
        return
    }
    
}
