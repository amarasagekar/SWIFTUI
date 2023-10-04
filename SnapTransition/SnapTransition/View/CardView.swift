//
//  CardView.swift
//  SnapTransition
//
//  Created by AMAR on 04/10/23.
//

import SwiftUI
import AVKit
 
struct CardView<Overlay: View>: View {
    var overlay: Overlay
    @Binding var videoFile: VideoFile
    @Binding var isExpanded: Bool
    var animatonID: Namespace.ID
    var isDetailView:Bool = false
    
    init(videoFile: Binding<VideoFile>, isExpanded: Binding<Bool>, animationID: Namespace.ID, isDetailView: Bool = false, @ViewBuilder overlay: @escaping()-> Overlay){
        self._videoFile = videoFile
        self._isExpanded = isExpanded
        self.isDetailView = isDetailView
        self.animatonID = animationID
        self.overlay = overlay()
    }
    var body: some View {
        GeometryReader{
            let size = $0.size
            
            //Display thumbnail insted of paused video
            
            //it will use AVPlayer directly , so memory consumtion is high
//            CustomVideoPlayer(player: videoFile.player)
//                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            //For memory saving, display thumbnail
            if let thumbnail = videoFile.thumbnail{
             Image(uiImage: thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(videoFile.playVideo ? 0 : 1)
                    .frame(width: size.width, height: size.height)
                    .overlay(content: {
                        if videoFile.playVideo && isDetailView{
                            CustomVideoPlayer(player: videoFile.player)
                                .transition(.identity)
                        }
                    })
                    .overlay(content: {
                        overlay
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .scaleEffect(scale)
            }else{
                Rectangle()
                    .foregroundColor(.clear)
                    .onAppear{
                        extractImageAt(time: .zero, size: screenSize) { thumbnail in
                            videoFile.thumbnail = thumbnail
                        }
                    }
            }
            
        }
        // Adding method geometry
        .matchedGeometryEffect(id: videoFile.id.uuidString, in: animatonID)
        //Adding offset and scaling
        .offset(videoFile.offset)
        // Making it centre
        .offset(y: videoFile.offset.height * -0.7)
       
    }
    
    var scale: CGFloat{
        var yOffset = videoFile.offset.height
        
        //Applying scaling only when dragged downwards
        yOffset = yOffset < 0 ? 0 : yOffset
        var progress = yOffset / screenSize.height
        
        //limiting progress
        progress = 1 - (progress > 0.4 ? 0.4 : progress)
        // When the view is closed Immediatly resetting scale to 1
        return (isExpanded ?  progress : 1)
    }
    
    // Extracting Thumbnail from video using AVAssetGenerator
    func extractImageAt(time: CMTime,size: CGSize, completion: @escaping(UIImage)->()){
        DispatchQueue.global(qos: .userInteractive).async {
            let asset = AVAsset(url: videoFile.fileURL)
            let genrator = AVAssetImageGenerator(asset: asset)
            genrator.appliesPreferredTrackTransform = true
            genrator.maximumSize = size
         
            Task{
                do{
                    let cgImage = try await genrator.image(at: time).image
                    guard let colorCorrectedImage = cgImage.copy(colorSpace: CGColorSpaceCreateDeviceRGB()) else {return}
                    let thumbnail = UIImage(cgImage: colorCorrectedImage)
                    
                    await MainActor.run {
                        completion(thumbnail)
                    }
                }catch{
                        print("Failed to fetch thumbnail")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View{
    var screenSize: CGSize{
        guard let size = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.screen.bounds.size else{return .zero}
        return size
    }
}
