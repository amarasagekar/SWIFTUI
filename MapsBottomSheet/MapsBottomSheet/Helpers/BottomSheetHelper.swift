//
//  BottomSheetHelper.swift
//  MapsBottomSheet
//
//  Created by AMAR on 12/03/24.
//

import SwiftUI
extension View{
    @ViewBuilder
    ///Default tab bar height = 49
    
    func bottomMaskForSheet(_ height: CGFloat = 49)-> some View{
        self
            .background(SheetRootViewFinder(height: height))
    }
}
///Helpers
fileprivate struct SheetRootViewFinder: UIViewRepresentable{
    var height:CGFloat
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> UIView {
        return .init()
    }
    
    func updateUIView(_ uiView: UIView, context: Context){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            if let rootView = uiView.viewBeforeWindow{
                let safeArea = uiView.safeAreaInsets
                ///updating its height so that it will create a empty space in the bottom
                rootView.frame = .init(origin: .zero, size: .init(width: rootView.frame.width, height: rootView.frame.height - (height + safeArea.bottom)))
                rootView.clipsToBounds = true
                for view in rootView.subviews {
                    //removing shadow
                    view.layer.shadowColor = UIColor.clear.cgColor
                    
                    if view.layer.animationKeys() != nil{
                        if let cornerradiusView = view.allSubviews.first(where: {$0.layer.animationKeys()?.contains("cornerRadius") ?? false }){
                            print(cornerradiusView)
                        }
                    }
                }
            }
        }
    }
    
    class Coordinator:NSObject {
        //Status
        var isMasked: Bool = false
    }
}

fileprivate extension UIView{
    var viewBeforeWindow:UIView?{
        if let superview, superview is UIWindow{
            return self
        }
        return superview?.viewBeforeWindow
    }
    //retriving all subviews from an uiview
    var allSubviews: [UIView]{
        return subviews.flatMap{[$0] + $0.subviews}
    }
}

#Preview{
    ContentView()
}
