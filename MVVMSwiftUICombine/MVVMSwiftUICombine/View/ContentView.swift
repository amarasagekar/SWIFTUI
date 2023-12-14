//
//  ContentView.swift
//  MVVMSwiftUICombine
//
//  Created by AMAR on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView{
            List{
                listSection
            }
            .navigationTitle("Content List")
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(service: ContentService()))
}

private extension ContentView {
    var listSection: some View{
        Section{
            ForEach(viewModel.arrayItem) {item in
            PlaceholderListRow(item: item)
            }
        }
    }
}
