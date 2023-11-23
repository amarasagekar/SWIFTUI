//
//  FeedView.swift
//  TikTokTutorial
//
//  Created by AMAR on 23/11/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0) {
                ForEach(0 ..< 10){post in
                   FeedCell(post: post)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    FeedView()
}
