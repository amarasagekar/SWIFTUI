//
//  JSONViewModel.swift
//  CompositionalLayout
//
//  Created by Immortal Lion on 23/02/24.
//

import Foundation
class JSONViewModel: ObservableObject{
    
    @Published var cards: [Card] = []
    
    //Search
    @Published var search = ""
    
    // Compositiaonal Lau=yout array
    @Published var compositionalArray : [[Card]] = []
    
    init() {
        fetchJSON()
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
                self.setCompositionalLayout()
            }
        }
        .resume()
    }
    
    func setCompositionalLayout(){
        var currentArrayCards: [Card] = []
        
        cards.forEach { (card) in
            currentArrayCards.append(card)
            if currentArrayCards.count == 3 {
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
            
            if currentArrayCards.count != 3 && card.id == cards.last!.id{
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
        }
    }
}
