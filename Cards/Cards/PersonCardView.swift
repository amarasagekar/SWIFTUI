//
//  PersonCardView.swift
//  Cards
//
//  Created by AMAR on 01/12/23.
//

import SwiftUI

struct PersonCardView: View {
    let person: Person
    var body: some View {
        VStack{
            ZStack{
                Image(person.headerImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 80)
                    .clipped()
                
                Image(person.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                    .clipShape(Circle())
                    .offset(y:40)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            .overlay(alignment: .topTrailing) {
                Button{
                    
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white)
                        .padding(6)
                }
            }
            VStack (spacing:0.0){
                Button{
                    
                } label: {
                    Text("Follow")
                        .padding(.vertical, 6)
                        .padding(.horizontal)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 2)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                HStack {
                    Text(person.name)
                        .fontWeight(.bold)
                    
                    Text(". \(person.fallowerCount)")
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                Text(person.jobTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom])
            }
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
    }
}

#Preview {
    PersonCardView(person: person1)
        .previewLayout(.sizeThatFits)
}
