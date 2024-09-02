//
//  IntroView.swift
//  Walkthrough+Morphing
//
//  Created by Immortal Lion on 19/08/24.
//

import SwiftUI

struct IntroView: View {
    @State private var activePage: Page = .page1
    var body: some View {
        GeometryReader{
            let size = $0.size
            VStack {
                MorphingSymboleView(symbole: activePage.rawValue, config: .init(font: .system(size: 150, weight: .bold), frame: .init(width: 250, height: 200), radius: 30, foregroundColor: .white
                    )
                )
                .onTapGesture {
                    activePage = activePage.nextpage
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background{
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
