//
//  MainViewViewModel.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import Foundation

class MainViewViewModel: ObservableObject {
    
    // TODO: Update this Bool and this UserID string when a user logs in
    
    @Published var currentUserId: String = "tiff"
    @Published var isSignedIn: Bool = true
    
    init () {}
    
//    public var isSignedIn: Bool {
//        return Auth.auth().currentUser != nil
//    }
}
