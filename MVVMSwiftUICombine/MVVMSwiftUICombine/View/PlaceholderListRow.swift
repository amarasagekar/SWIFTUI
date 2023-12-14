//
//  PlaceholderListRow.swift
//  MVVMSwiftUICombine
//
//  Created by AMAR on 14/12/23.
//

import SwiftUI

struct PlaceholderListRow: View {
    let item: PlaceholderResponsemodelElemennt
    
    var body: some View {
        HStack{
            VStack{
                Text(item.title)
                    .font(.title)
                    .foregroundStyle(.red)
                
                Spacer()
                Text(item.body)
            }
        }
    }
}

#Preview {
    PlaceholderListRow(item: PlaceholderResponsemodelElemennt(userID: 1, id: 1, title: "dummy text", body: "dummy body"))
}
