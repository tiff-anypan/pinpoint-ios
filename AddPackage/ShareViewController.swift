////
////  ShareViewController.swift
////  AddPackage
////
////  Created by Tiffany Pan on 3/1/25.
////
//

import UIKit
import Social
import UniformTypeIdentifiers
import SwiftUI

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure access to extensionItem and itemProvider
        guard let extensionItem = extensionContext?.inputItems.first as? NSExtensionItem,
              let itemProvider = extensionItem.attachments?.first else {
            close()
            return
        }
        
        let textDataType = UTType.plainText.identifier
        if itemProvider.hasItemConformingToTypeIdentifier(textDataType) {
            itemProvider.loadItem(forTypeIdentifier: textDataType, options: nil) { (providedText, error) in
                if let error {
                    print(error.localizedDescription)
                    self.close()
                    return
                }
                
                if let text = providedText as? String {
                    DispatchQueue.main.async {
                        // Extract the tracking number and also determine which carrier
                        
                        print(self.extractPackageInfo(text: text))
                        let trackingNum = self.extractPackageInfo(text: text)
                        
                        // Create a ViewModel instance and pre-fill trackingNumber with shared text
                        let viewModel = NewPackageViewModel()
                        viewModel.trackingNumber = trackingNum.0
                        viewModel.shippingCompany = trackingNum.1
                        
                        // Present the SwiftUI view within a UIHostingController
                        let hostingController = UIHostingController(
                            rootView: NewPackageView(
                                viewModel: viewModel, 
                                newPackagePresented: .constant(true),
                                onSave: { package in
                                    self.savePackage(package)
                                }
                            )
                        )
                        
                        self.addChild(hostingController)
                        self.view.addSubview(hostingController.view)
                        
                        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
                        hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
                        hostingController.view.bottomAnchor.constraint (equalTo: self.view.bottomAnchor).isActive = true
                        hostingController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
                        hostingController.view.rightAnchor.constraint (equalTo: self.view.rightAnchor).isActive = true
                    }
                } else {
                    self.close()
                    return
                }
            }
        } else {
            close()
            return
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("close"), object: nil, queue: nil) { _ in DispatchQueue.main.async {
                self.close()
            }
        }
        
    }
    
    /// Closes the share extension
    func close() {
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
    
    /// Extracts the tracking number and predicted carrier from a chunk of text
    func extractPackageInfo(text: String) -> (String, String) {
        // Define Regex pattern for tracking numbers
        
        let UPSpattern = #"1Z[A-Z0-9]{16}|\b\d{18,22}\b"#
        
        if let regex = try? NSRegularExpression(pattern: UPSpattern, options: []) {
            let range = NSRange(text.startIndex..<text.endIndex, in: text)
            if let match = regex.firstMatch(in: text, options: [], range: range) {
                let trackingNumber = String(text[Range(match.range, in: text)!])
                return (trackingNumber, "UPS")
            }
        }
        
        return ("", "")
    }
    
    func savePackage(_ package: Package) {
        // Handle package saving logic (e.g., save to UserDefaults or shared storage, or backend)
        
        // Close the extension when done
        self.close()
    }
}
