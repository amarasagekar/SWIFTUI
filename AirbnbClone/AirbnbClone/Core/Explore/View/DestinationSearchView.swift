//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by AMAR on 31/10/23.
//

import SwiftUI
enum DestinationSearchoption {
    case location
    case dates
    case guests
}
struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel : ExploreViewModel

    @State private var selectedOption: DestinationSearchoption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    
    
    var body: some View {
        VStack{
            HStack {
                Button{
                    withAnimation(.snappy){
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                if !viewModel.seatchLocation.isEmpty{
                    Button("clear"){
                        viewModel.seatchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                
            }
            .padding()
            
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text:  $viewModel.seatchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
            //Date selection view
            VStack{
                if selectedOption == .dates {
                    
                    Text("When's your trip")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading){
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                        
                    
                }else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 170 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
            
            //num guest view
            
            VStack(alignment: .leading){
                if selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    }  onDecrement: {
                        guard numGuests > 0 else {return}
                        numGuests -= 1
                    }
                     
                }else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
       
    }
}
