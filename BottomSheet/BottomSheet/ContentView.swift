//
//  ContentView.swift
//  BottomSheet
//
//  Created by AMAR on 22/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var showingBottomSheet = false
    
    var body: some View {
        VStack {
            Button("Tap Me"){
                showingBottomSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
        .sheet(isPresented: $showingBottomSheet){
            BottomSheetView()
                .presentationDetents([.fraction(0.2), .medium])
                
                .presentationDragIndicator(.visible)
        }
    }
}


struct BottomSheetView: View {
    var body: some View {
        Text("Select")
            .font(.title)
        HStack{
          Image(systemName: "star")
                .padding()
            Image(systemName: "bell")
                  .padding()
            Image(systemName: "globe")
                  .padding()
            Image(systemName: "house")
                  .padding()
        }
    }
}
#Preview {
    ContentView()
}
