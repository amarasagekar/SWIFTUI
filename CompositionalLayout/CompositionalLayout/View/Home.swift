//
//  Home.swift
//  CompositionalLayout
//
//  Created by Immortal Lion on 23/02/24.
//

import SwiftUI

struct Home: View {
    @StateObject var jasonModel = JSONViewModel()
    var body: some View {
        VStack{
            HStack {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.gray)
                    
                    TextField("Search", text: $jasonModel.search)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(10)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 30))
                        .foregroundStyle(.primary)
                })
            }
            .padding()
            
            if jasonModel.cards.isEmpty{
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
                ScrollView{
                    //Compositional Layout.....
                    
                }
            }
        }
    }
}

#Preview {
    Home()
}
