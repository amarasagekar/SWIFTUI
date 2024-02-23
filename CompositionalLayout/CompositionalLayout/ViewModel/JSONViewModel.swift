//
//  JSONViewModel.swift
//  CompositionalLayout
//
//  Created by Immortal Lion on 23/02/24.
//

import Foundation
class JSONViewModel: ObservableObject{
    @Published var cards: [Card] = []
    
    init() {
        
    }
    
    func fetchJSON(){
        let url = "https:picsum.photos/v2/list?page=2&limit=100"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            guard let json = data else {return}
            
            let jsonvalues = try? JSONDecoder().decode([Card].self, from: json)
            
            guard let cards = jsonvalues else{return}
            
            DispatchQueue.main.async {
                self.cards = cards
            }
        }
        .resume()
    }
}
