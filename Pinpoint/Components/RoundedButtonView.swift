//
//  RoundedButtonView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import SwiftUI

struct RoundedButtonView: View {
    
    let title: String
    let backgroundColor: Color
    
    // Define an action for the button. Passed in as a closure so that it can be defined when you initialize this button
    let action: () -> Void

    var body: some View {
        Button {
            // Action that should occur
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
            }
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    RoundedButtonView(title: "Register", backgroundColor: .gray) { // Action
        
    }
}
