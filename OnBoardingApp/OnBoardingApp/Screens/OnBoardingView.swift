//
//  OnBoardingView.swift
//  OnBoardingApp
//
//  Created by AMAR on 17/02/24.
//

import SwiftUI

struct OnBoardingView: View {
    var outDoorActivity: OutDoorActivity
    
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    
    var body: some View {
        ZStack {
            VStack{
                Image("image-1")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 2, y: 2)
                
                Text("Hiking")
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                
                Text("this is a description")
                    .fontWeight(.light)
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                    .padding(.bottom, 15)
                    .multilineTextAlignment(.center)
                
                ButtonView(onPress: {
                    isOnBoarding = false
                })
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(
                LinearGradient(colors: [.customColorHikingDark, .customColorHikingLight], startPoint: .bottom, endPoint: .top)
            )
        }
    }
}

#Preview {
    OnBoardingView(outDoorActivity: <#OutDoorActivity#>)
}
