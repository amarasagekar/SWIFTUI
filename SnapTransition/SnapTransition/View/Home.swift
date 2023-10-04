//
//  Home.swift
//  SnapTransition
//
//  Created by AMAR on 04/10/23.
//

import SwiftUI

struct Home: View {
    
    @State private var videoFiles: [VideoFile] = files
    @State private var expandedID: String?
    @State private var isExpanded: Bool = false
    @Namespace private var namesapce
//    @State private var expanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            HeaderView()
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    ForEach($videoFiles){ $file in
                        if expandedID == file.id.uuidString && isExpanded{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 300)
                        }else{
                            CardView(videoFile: $file, isExpanded: $isExpanded, animationID: namesapce){
                                
                            }
                            .frame(height: 300)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.8)){
                                    isExpanded = true
                                    expandedID = file.id.uuidString
                                }
                            }

                        }
                    }
                }
                .padding(.horizontal,15)
                .padding(.vertical,10)
            }
        }
        .overlay {
            if let expandedID,isExpanded{
                DetailView(videoFile: $videoFiles.index(expandedID), isExpanded: $isExpanded, animationID: namesapce)
                //for smooth expansion
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y:5)))
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7)) {
                            isExpanded = false
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView()->some View{
        HStack(spacing: 12){
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .headerButtonBG()
            
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .headerButtonBG()
            }
            Spacer(minLength: 0)
            Button {
                
            } label: {
                Image(systemName: "person.badge.plus")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .headerButtonBG()
            }
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .headerButtonBG()
            }

        }
        .overlay(content: {
            Text("Stories")
                .font(.title3)
                .fontWeight(.black)
        })
        .padding(.horizontal,15)
        .padding(.vertical, 10)
    }
}

struct DetailView: View{
    @Binding var videoFile: VideoFile
    @Binding var isExpanded: Bool
    var animationID: Namespace.ID
    
    @GestureState private var isDragging: Bool = false
    var body: some View{
        GeometryReader{
            let safeArea = $0.safeAreaInsets
            CardView(videoFile: $videoFile, isExpanded: $isExpanded, animationID: animationID, isDetailView: true) {
                OverlayView()
                    .padding(.top, safeArea.top)
                    .padding(.bottom, safeArea.bottom)
            }
            .ignoresSafeArea()
        }
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                }).onChanged({ value in
                    var translation = value.translation
                    translation = isDragging && isExpanded ? translation : .zero
                    videoFile.offset = translation
                    
                }).onEnded({ value in
                    if value.translation.height > 200 {
                        //Clloasing View with animation
                        videoFile.player.pause()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                            videoFile.player.seek(to: .zero)
                            videoFile.playVideo = false
                        }
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7)){
                            videoFile.offset = .zero
                            isExpanded = false
                        }
                    }else{
                        withAnimation(.easeInOut(duration: 0.25)){
                            videoFile.offset = .zero
                        }
                    }
                    withAnimation(.easeOut(duration: 0.25)){
                        videoFile.offset = .zero
                    }
                })
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.28){
                //transition need animation
                withAnimation(.easeInOut){
                    videoFile.playVideo = true
                    videoFile.player.play()
                }
            }
        }
    }
    
    @ViewBuilder
    func OverlayView()->some View{
        VStack{
            HStack{
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                VStack(alignment: .leading,spacing: 4) {
                    Text("iJustine")
                        .font(.callout)
                        .fontWeight(.bold)
                    Text("4 hr ago")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "bookmark")
                    .font(.title3)
                
                Image(systemName: "ellipsis")
                    .font(.title3)
                    .rotationEffect(.init(degrees: -90))
                
            }
            .foregroundColor(.white)
            .frame(maxHeight: .infinity, alignment: .top)
            // Hiding when dragging
            .opacity(isDragging ? 0 : 1)
            .animation(.easeInOut(duration: 0.2), value: isDragging)
            
            Button {
                
            } label: {
                Text("View More Episodes")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 12)
                    .padding(.vertical,8)
                    .background {
                        Capsule()
                            .fill(.white)
                    }
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .trailing){
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background{
                            Circle()
                                .fill(.ultraThinMaterial)
                        }
                }

            }

        }
        .padding(.horizontal,15)
        .padding(.vertical,10)
        // Disp;laying video only when videos starts playing
        .opacity(videoFile.playVideo && isExpanded ? 1 : 0)
    }
}
#Preview {
    Home()
}

extension Binding<[VideoFile]>{
    func index(_ id: String)->Binding<VideoFile>{
        let index = self.wrappedValue.firstIndex { item in
            item.id.uuidString == id
        } ?? 0
        return self[index]
    }
}

extension View{
    func headerButtonBG()->some View{
        self
            .frame(width: 25, height: 25)
            .background{
                Circle()
                    .fill(.gray.opacity(0.1))
            }
    }
}
