//
//  ContentViewModel.swift
//  MVVMSwiftUICombine
//
//  Created by AMAR on 14/12/23.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var arrayItem: PlaceholderResponsemodel = []
    var cancellable = Set<AnyCancellable>()
    let service: ContentService
    
    init(service: ContentService) {
        self.service = service
        getData()
    }
    
    func getServcerData(){
        service.getPlaceholderData()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("error--\(error)")
                case .finished:
                    print("Completion")
                }
            } receiveValue: { [weak self] response in
                self?.arrayItem = response
            }
            .store(in: &cancellable)

    }
    
    func getData(){
        let item = PlaceholderResponsemodelElemennt(userID: 1, id: 1, title: "test", body: "test Description")
        let item1 = PlaceholderResponsemodelElemennt(userID: 2, id: 2, title: "test1", body: "test Description1")
        arrayItem.append(item)
        arrayItem.append(item1)
    }
}
