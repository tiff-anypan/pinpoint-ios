//
//  Package.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 2/26/25.
//

import Foundation

struct Package: Codable, Identifiable {
    let id: String
    let packageName: String
    let trackingNumber: String
    let shippingCompany: String
    var delivered: Bool
    
    mutating func setDelivered(_ state: Bool) {
        // Update the model to the correct state
        delivered = state
    }
}
