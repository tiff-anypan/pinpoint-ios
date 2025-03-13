//
//  MainViewViewModel.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import Foundation

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    @Published var isSignedIn: Bool = false
    
    init () {}
    
    // TODO: Perform Log-In call here
}
