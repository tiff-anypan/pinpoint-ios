//
//  MainView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 3/13/25.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            PackageListView(viewModel: PackageListViewModel())
        } else {
            RegisterView()
        }
    }
    
}

#Preview {
    MainView()
}
