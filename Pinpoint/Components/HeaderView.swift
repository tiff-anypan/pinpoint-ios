//
//  HeaderView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import SwiftUI

struct HeaderView: View {
    let headerText: String
    let subheaderText: String
    
    var body: some View {
        VStack {
            HStack {
                Text(headerText)
                    .font(.system(size: 56, weight: .regular, design: .rounded))
                Spacer()
            }
            .padding(.leading)
            
            HStack {
                Text(subheaderText)
                    .font(.system(size: 28, weight: .regular, design: .rounded))
                Spacer()
            }
            .padding(.leading)
        }
    }
}

#Preview {
    HeaderView(headerText: "Hello,",
               subheaderText: "Returning user?")
}
