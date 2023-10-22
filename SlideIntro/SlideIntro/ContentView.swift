//
//  ContentView.swift
//  SlideIntro
//
//  Created by Amar Asagekar on 22/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotApperance = UIPageControl.appearance()
    
    
    var body: some View {
        TabView(selection: $pageIndex){
            ForEach(pages) { page in
                VStack{
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page == pages.last {
                        Button("Sign Up") {
                            goToZero()
                        }
                        .buttonStyle(.bordered)
                    }else {
                        Button("next", action: increamentPage)
                    }
                    Spacer()
                }
                .tag(page.tag)
            }
            
        }
        .animation(.easeOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotApperance.currentPageIndicatorTintColor = .black
            dotApperance.pageIndicatorTintColor = .gray
        }
    }
    
    func increamentPage(){
        pageIndex += 1
    }
    
    func goToZero(){
        pageIndex = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
