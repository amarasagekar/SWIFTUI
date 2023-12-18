//
//  Toast.swift
//  CustomToasts
//
//  Created by AMAR on 18/12/23.
//
//3:43
import SwiftUI

struct RootView<Content: View> : View {
    @ViewBuilder var content: Content
    
    @State private var overlayWindow: UIWindow?
    var body: some View {
        content
            .onAppear{
                if let windowScence = UIApplication.shared.connectedScenes.first as? UIWindowScene, overlayWindow == nil {
                    let window = PassthroughWindow(windowScene: windowScence)
                    window.backgroundColor = .clear
                    ///View Controller
                    let rootController = UIHostingController(rootView: Toastgroup())
                    rootController.view.frame = windowScence.keyWindow?.frame ?? .zero
                    rootController.view.backgroundColor = .clear
                    window.rootViewController = rootController
                    window.isHidden = false
                    window.isUserInteractionEnabled = true
                    window.tag = 1009
                    
                    overlayWindow = window
                }
            }
    }
}

fileprivate class PassthroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil}
        
        return rootViewController?.view == view ? nil : view
    }
}

fileprivate struct Toastgroup: View {
    var body: some View {
        GeometryReader{
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            ZStack{
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
}
