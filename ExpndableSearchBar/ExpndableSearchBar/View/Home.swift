//
//  Home.swift
//  ExpndableSearchBar
//
//  Created by AMAR on 11/07/24.
//

import SwiftUI

struct Home: View {
    /// View properties
    @State private var searchText: String = ""
    @State private var activeTab: Tab = .all
    @Environment(\.colorScheme) private var scheme
    @Namespace private var animation
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15){
                DummyMessageView()
            }
            .safeAreaPadding(15)
            .safeAreaInset(edge: .top, spacing: 0){
                ExpandableNavigationBar()
            }
        }
        .background(.gray.opacity(0.15))
    }
    
    
    ///Expandable Navigation bar
    @ViewBuilder
    func ExpandableNavigationBar(_ title: String = "Messages") -> some View{
        VStack(spacing: 10){
            ///Title
            Text(title)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
            /// Search Bar
            HStack(spacing: 12){
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                
                TextField("Search Conversations", text:$searchText)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .frame(height: 45)
            .background{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.background)
            }
            
            ///Custom Segmented picker
            ScrollView(.horizontal) {
                HStack(spacing: 12){
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Button(action: {
                            withAnimation(.snappy) {
                                activeTab = tab
                            }
                        }) {
                            Text(tab.rawValue)
                                .font(.callout)
                                .foregroundStyle(activeTab == tab ? (scheme == .dark ? .black : .white) : Color.primary)
                                .padding(.vertical,8)
                                .padding(.horizontal, 15)
                                .background{
                                    if activeTab == tab {
                                        Capsule()
                                            .fill(Color.primary)
                                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                    } else{
                                        Capsule()
                                            .fill(.background)
                                    }
                                }
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
            }
            .frame(height: 50)
        }
        .padding(.top, 25)
        .safeAreaPadding(.horizontal, 15)
        .padding(.bottom, 10)
    }
    ///Dummy Messgae View
    @ViewBuilder
    func DummyMessageView() -> some View{
        ForEach(0..<20, id: \.self){ _ in
            HStack(spacing: 12) {
                Circle()
                    .frame(width: 55, height: 55)
                
                VStack(alignment: .leading, spacing: 6) {
                    Rectangle()
                        .frame(width: 140, height: 8)
                    
                    Rectangle()
                        .frame(height: 8)
                    
                    Rectangle()
                        .frame(width: 80, height: 8)
                }
            }
            .foregroundStyle(.gray.opacity(0.25))
            .padding(.horizontal, 15)
        }
    }
    
}

#Preview {
    ContentView()
}
