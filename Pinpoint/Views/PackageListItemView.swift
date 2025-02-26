//
//  PackageListItemView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 2/26/25.
//

import SwiftUI

struct PackageListItemView: View {
    
    @StateObject var viewModel = PackageListViewModel()
    
    let package: Package
    
    var body: some View {
        HStack {
            Image(systemName: "truck.box")
            VStack(alignment: .leading) {
                Text(package.packageName)
                    .foregroundStyle(.black)
                    .font(.system(size: 18, weight: .semibold,design:.rounded))
                    
                Text(package.trackingNumber)
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
            
            Spacer()
            
            Text(package.shippingCompany)
                .foregroundStyle(.black)
                .font(.system(size: 14, weight: .semibold,design:.rounded))
            
        }
//        .padding(.horizontal)
    }
}

#Preview {
    PackageListItemView(package: Package(id: "1", packageName: "Chalk bag", trackingNumber: "1Z7F572V0227894600", shippingCompany: "UPS", delivered: true))
}
