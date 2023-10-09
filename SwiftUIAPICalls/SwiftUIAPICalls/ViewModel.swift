//
//  ViewModel.swift
//  SwiftUIAPICalls
//
//  Created by AMAR on 08/10/23.
//

import SwiftUI

struct Course: Hashable, Codable{
    let image: String
    let name: String
}

class ViewModel: ObservableObject{
    @Published var courses: [Course] = []
    
    func fetch(){
        guard let url = URL(string:
                                "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self]data, _, error in
            guard let data = data, error == nil else{
                return
            }
            //convert to json
            
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
