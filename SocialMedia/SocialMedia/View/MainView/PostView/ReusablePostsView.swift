//
//  ReusablePostsView.swift
//  SocialMedia
//
//  Created by AMAR on 02/10/23.
//

import SwiftUI
import Firebase

struct ReusablePostsView: View {
    
    var basedOnUID: Bool = false
    var uid: String = ""
    @Binding var posts:[Post]
    @State private var isFetching:Bool = true
    @State private var paginationDoc: QueryDocumentSnapshot?
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            LazyVStack{
                if isFetching{
                    ProfileView()
                        .padding(.top, 30)
                }else{
                    if posts.isEmpty{
                       Text("No Post's Found")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 30)
                    }else{
                        Posts()
                    }
                }
            }
            .padding(15)
        }
        .refreshable {
            // scroll to refersh
            //Disable refersh for uid based post
            guard !basedOnUID else{return}
            isFetching = true
            posts = []
            // resetting pagination doc
            paginationDoc = nil
            await fetchPosts()
        }
        .task {
            guard posts.isEmpty else{return}
            await fetchPosts()
        }
    }
    
    @ViewBuilder
    func Posts()-> some View{
        ForEach(posts){post in
            PostCardView(post: post) { updatedPost in
                if let index = posts.firstIndex(where: { post in
                    post.id == updatedPost.id
                }){
                    posts[index].likedIDs = updatedPost.likedIDs
                    posts[index].dislikedIDs = updatedPost.dislikedIDs
                }
            } onDelete: {
                withAnimation(.easeInOut(duration: 0.25)) {
                    posts.removeAll{post.id == $0.id}
                }
            }
            .onAppear{
                //fetch new post after last post appears
                if post.id == posts.last?.id && paginationDoc != nil {
                    Task{
                        await fetchPosts()
                    }
                }
            }
            Divider()
                .padding(.horizontal,-15)
        }
    }
    
    func fetchPosts()async{
        do{
            var query: Query!
            if let paginationDoc{
                query = Firestore.firestore().collection("Posts")
                    .order(by: "publishedDate", descending: true)
                    .start(afterDocument: paginationDoc)
                    .limit(to: 20)
            }else{
                query = Firestore.firestore().collection("Posts")
                    .order(by: "publishedDate", descending: true)
                    .limit(to: 20)
            }
            //New query for uid based document fetch
            if basedOnUID{
                query = query
                    .whereField("userUID", isEqualTo: uid)
            }
            let docs = try await query.getDocuments()
            let fetchedPosts = docs.documents.compactMap { doc -> Post? in
                try? doc.data(as: Post.self)
            }
            await MainActor.run(body: {
                posts.append(contentsOf: fetchedPosts)
                paginationDoc = docs.documents.last
                isFetching = false
            })
        }catch{
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
