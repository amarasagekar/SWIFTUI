//
//  HomeView.swift
//  UberTutorial
//
//  Created by AMAR on 29/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
