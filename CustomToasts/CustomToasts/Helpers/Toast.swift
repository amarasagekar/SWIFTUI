//
//  Toast.swift
//  CustomToasts
//
//  Created by AMAR on 18/12/23.
//
//
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

@Observable
class Toast{
    static let shared = Toast()
    fileprivate var toasts: [ToastItem] = []
    
    func present(title: String, symbol: String?, tint: Color = .primary, isuserIntractionEnabled: Bool = false, timing: ToastTime = .medium){
        toasts.append(.init(title: title, symbol: symbol, tint: tint, isUserInteractionEnabled: isuserIntractionEnabled, timing: timing))
        
    }
}

struct ToastItem: Identifiable {
    let id: UUID = .init()
    var title: String
    var symbol: String?
    var tint: Color
    var isUserInteractionEnabled: Bool
    var timing: ToastTime = .medium
}

enum ToastTime: CGFloat {
    case short = 1.0
    case medium = 2.0
    case long = 3.5
}

fileprivate struct Toastgroup: View {
    var model = Toast.shared
    var body: some View {
        GeometryReader{
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            ZStack{
                ForEach(model.toasts){
                    ToastView(size: size, item: $0)
                }
            }
            .padding(.bottom, safeArea.top == .zero ? 15 : 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
}

fileprivate struct ToastView: View {
    let size: CGSize
    var item: ToastItem
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
