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
    
    init() {}
    
}
