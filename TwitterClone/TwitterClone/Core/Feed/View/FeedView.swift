//
//  FeedView.swift
//  TwitterClone
//
//  Created by AMAR on 09/10/23.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets){ tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName:"pencil.slash")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView){
               NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FeedView()
}
