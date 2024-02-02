//
//  ShareViewController.swift
//  Share
//
//  Created by AMAR on 02/02/24.
//

import UIKit
import Social
import SwiftUI

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //Interactive Dismiss Disabled
        isModalInPresentation = true
        
        let hostingView = UIHostingController(rootView: ShareView(extensionContext: extensionContext))
        hostingView.view.frame = view.frame
        view.addSubview(hostingView.view)
    }
}

fileprivate struct ShareView: View {
    var extensionContext: NSExtensionContext?
    var body: some View {
        VStack(spacing: 15) {
            Text("Add to favourite")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button("Cancel") {
                        
                    }
                    .tint(.red)
                }
            Spacer(minLength: 0)
        }
        .padding(15)
    }
}
