//
//  LoginViewViewController.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    
    /* ObservableObject allows the class to have publishers
     that emits before the object is changed
    */
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else { return }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        print("logging in")
        return true
    }
}
