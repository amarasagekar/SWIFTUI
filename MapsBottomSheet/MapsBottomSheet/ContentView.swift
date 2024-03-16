//
//  ContentView.swift
//  MapsBottomSheet
//
//  Created by AMAR on 03/03/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showSheet: Bool = false
    @State private var activeTab: Tab = .devices
    @State private var ignoreTabBar: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            if #available(iOS 17, *){
                Map(initialPosition: .region(.applePark))
            }else{
                Map(coordinateRegion: .constant(.applePark))
            }
            //tab Bar
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet){
            ScrollView(.vertical, content: {
                VStack(alignment: .leading, spacing: 15, content: {
                    Text(activeTab.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Toggle("Ignore Tab Bar", isOn: $ignoreTabBar)
                })
                .padding()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            .bottomMaskForSheet(mask: !ignoreTabBar)
        }
    }
    //TabBar
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0){
           
            ForEach(Tab.allCases, id: \.rawValue){ tab in
                Button(action: {activeTab = tab }, label: {
                    VStack(spacing: 2){
                        Image(systemName: tab.symbol)
                            .font(.title2)
                        
                        Text(tab.rawValue)
                            .font(.caption2)
                    }
                    .foregroundStyle(activeTab == tab ? Color.accentColor : .gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                })
                .buttonStyle(.plain)
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

extension MKCoordinateRegion{
    //Apple Mark region
    static var applePark: MKCoordinateRegion{
        let center = CLLocationCoordinate2D(latitude: 37.334606, longitude: -122.009102)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
