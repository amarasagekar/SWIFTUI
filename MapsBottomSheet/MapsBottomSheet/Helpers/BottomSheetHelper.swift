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
}
