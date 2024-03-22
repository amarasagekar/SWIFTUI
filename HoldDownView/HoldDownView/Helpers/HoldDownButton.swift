//
//  HoldDownView.swift
//  HoldDownView
//
//  Created by Immortal Lion on 22/03/24.
//

import SwiftUI

struct HoldDownButton: View {
    ///Config
    var text: String
    var paddingHorizontal: CGFloat = 25
    var paddingVertical: CGFloat = 12
    var duration: CGFloat = 1
    var background: Color
    var loadingTint: Color
    var shape: AnyShape = .init(.capsule)
    var action: () -> ()
    
    @State private var timer =  Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()
    @State private var timeCount: CGFloat = 0
    @State private var progress: CGFloat = 0
    @State private var isHolding: Bool = false
    @State private var isCompleted: Bool = false
    
    var body: some View {
        Text(text)
            .padding(.vertical, paddingVertical)
            .padding(.horizontal, paddingHorizontal)
            .background{
                GeometryReader{
                    let size = $0.size
                    
                    Rectangle()
                        .fill(background.gradient)
                    
                    Rectangle()
                        .fill(loadingTint)
                        .frame(width: size.width * progress)
                }
            }
            .clipShape(shape)
            .contentShape(shape)
            ///Gesture
            .onAppear(perform: {
                cancelTimer()
            })
    }
    
    var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: duration)
            .onChanged {
                isHolding = $0
            }
            .onEnded { status in
                
            }
    }
    ///Add Timer
    func addTimer(){
        timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()
    }
    //Cancels Timer
    func cancelTimer(){
        timer.upstream.connect().cancel()
    }
}

#Preview {
    ContentView()
}
