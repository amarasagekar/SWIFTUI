//
//  NotificationView.swift
//  TikTokTutorial
//
//  Created by AMAR on 24/11/23.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 24){
                    ForEach(0 ..< 10) { notification in
                       NotificationCell()
                    }
                }
            }
            .navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    NotificationView()
}
