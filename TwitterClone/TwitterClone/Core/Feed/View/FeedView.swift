//
//  FeedView.swift
//  TwitterClone
//
//  Created by AMAR on 09/10/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyHStack{
                ForEach(0 ... 20, id: \.self){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
