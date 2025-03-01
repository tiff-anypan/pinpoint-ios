//
//  NewPackageViewModel.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 2/26/25.
//

import Foundation

class NewPackageViewModel: ObservableObject {
    
    @Published var packageName = ""
    @Published var trackingNumber = ""
    @Published var shippingCompany = ""
    
    @Published var showAlert = false
    
    init() {}
    
    func save() {}
    
    /*
     Computed property canSave performs a validation check on
     whether user entered valid inputs for all fields.
     */
    var canSave: Bool {
        guard !packageName.trimmingCharacters(in: .whitespaces).isEmpty &&
                !trackingNumber.trimmingCharacters(in: .whitespaces).isEmpty &&
                !shippingCompany.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
    
}
