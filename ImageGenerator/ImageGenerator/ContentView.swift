//
//  ContentView.swift
//  ImageGenerator
//
//  Created by AMAR on 27/01/24.
//

import SwiftUI
import OpenAIKit

final class ViewModel: ObservableObject{
    private var openai: OpenAI?
    
    func setup(){
        openai = OpenAI(Configuration(
        organizationId: "Personal", apiKey: "open ai api key"
        ))
    }
    
    func generateImage(prompt: String) async -> UIImage? {
        guard let openai = openai else {
            return nil
        }
        do{
            let params =  ImageParameters(prompt: prompt, resolution: .medium, responseFormat: .base64Json)
            
            let  result = try await openai.createImage(parameters: params)
            let data = result.data[0].image
            let image = try openai.decodeBase64Image(data)
            return image
        }catch{
            print(String(describing: error))
            return nil
        }
    }
}
struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var image : UIImage?
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                if let image = image{
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                }else{
                    Text("Type prompt to generate image!")
                }
                Spacer()
                
                TextField("Type prompt here.....", text: $text)
                    .padding()
                Button("Generate!"){
                    if !text.trimmingCharacters(in: .whitespaces).isEmpty{
                        Task{
                            let result = await viewModel.generateImage(prompt: text)
                            if result == nil {
                                print("Failed to get image")
                            }
                            self.image = result
                        }
                    }
                }
            }
            .navigationTitle("DALL-E Image Generator")
            .onAppear{
                viewModel.setup()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}


