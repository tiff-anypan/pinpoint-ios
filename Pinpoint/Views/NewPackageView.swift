//
//  NewPackageView.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 2/26/25.
//

import SwiftUI

struct NewPackageView: View {
    
    @StateObject var viewModel: NewPackageViewModel
    // Connects back to PackageListView to determine whether this view should be presented or not
    @Binding var newPackagePresented: Bool
    
    var onSave: (Package) -> Void // Used to add the package to the List View
    
    var body: some View {
        VStack {
            Text("New Package")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.primary)
                .padding(.top, 40)
                .padding(.leading)
                .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 2)
            
            // Divider with shadow
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 2)
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                .padding(.top, 10)
            
            Form {
                Group {
                    HStack {
                        Image(systemName: "a.square")
                            .foregroundStyle(.gray)
                        TextField("Package Name", text: $viewModel.packageName)
                            .padding(.leading, 5)
                    }
                    HStack {
                        Image(systemName: "number")
                            .foregroundStyle(.gray)
                        TextField("Tracking Number", text: $viewModel.trackingNumber)
                            .padding(.leading, 5)
                    }

                    HStack {
                        Image(systemName: "truck.box")
                            .foregroundStyle(.gray)
                        TextField("Shipping Company", text: $viewModel.shippingCompany)
                    }
                }
                .listRowSeparator(.hidden)
                .autocorrectionDisabled()
                
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        let newPackage = Package(id: UUID().uuidString, packageName: viewModel.packageName, trackingNumber: viewModel.trackingNumber, shippingCompany: viewModel.shippingCompany, delivered: false)
                        onSave(newPackage) // call closure to pass new pkg back
                        newPackagePresented = false
                        close()
                    } else {
                        // Display error message for user by changing this @Published variable in our VM
                        viewModel.showAlert = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(textFieldsNotEmpty() ? .blue : .gray)

                        Text("Add Package")
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                    }
                }
                .listRowSeparator(.hidden)
                .padding(.vertical)
                
            }
            .scrollContentBackground(.hidden)
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields!"))
            })
        }
    }
    
    private func textFieldsNotEmpty() -> Bool {
        return !viewModel.packageName.isEmpty &&
               !viewModel.trackingNumber.isEmpty &&
               !viewModel.shippingCompany.isEmpty
    }
    
    func close() {
            NotificationCenter.default.post(name: NSNotification.Name("close"), object: nil)
    }
    
}

#Preview {
    NewPackageView(viewModel: NewPackageViewModel(), newPackagePresented: .constant(true)) { _ in
        // Do nothing, just a placeholder for preview
    }
}
