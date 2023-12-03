//
//  LocationSearchResultCell.swift
//  UberTutorial
//
//  Created by AMAR on 03/12/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell(title: "StartBucks", subTitle: "123 main St")
}
