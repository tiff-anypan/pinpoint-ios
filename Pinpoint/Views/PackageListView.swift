//
//  PackageListView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 2/26/25.
//

import SwiftUI

struct PackageListView: View {
    
    @StateObject var viewModel: PackageListViewModel
    
    @State private var packages: [Package] = [
        Package(id: "1", packageName: "Chalk bag", trackingNumber: "1Z7F572V0227894600", shippingCompany: "UPS", delivered: true),
        Package(id: "2", packageName: "Bannoch Pro backpack", trackingNumber: "1Z7F572V0227894600", shippingCompany: "UPS", delivered: false)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("On the Way")) {
                    ForEach(packages.filter { !$0.delivered }) { package in PackageListItemView(package: package)
                            .swipeActions {
                                Button("Delete") {
                                    if let index = packages.firstIndex(where: { $0.id == package.id }) { packages.remove(at: index)
                                    }
                                }
                                .tint(.red)
                            }
                    }
                }
                
                Section(header: Text("Delivered")) {
                    ForEach(packages.filter { $0.delivered }) { package in PackageListItemView(package: package)
                            .swipeActions {
                                Button("Delete") {
                                    // TODO: Make this delete animation look better.
                                    if let index = packages.firstIndex(where: { $0.id == package.id }) { packages.remove(at: index)
                                    }
                                }
                                .tint(.red)
                            }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Pinpoint 📍")
            .toolbar {
                Button {
                    // Action to add a new package to track
                    viewModel.showingNewPackageView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.gray)
                }
            }
            // Presents the sheet when the binding in isPresented is true.
            .sheet(isPresented: $viewModel.showingNewPackageView, content: {
                // When we hit save, in the NewPackageView, we update this newPackageRepresented variable that we pass in, which in this case is a binding that un-presents the view.
                // TODO: If a user has something in their clipboard, we can pre-load it here.
                NewPackageView(viewModel: NewPackageViewModel(), newPackagePresented: $viewModel.showingNewPackageView, onSave: { newPackage in packages.append(newPackage)
                })
            })
        }
    }
}

#Preview {
    PackageListView(viewModel: PackageListViewModel())
}
