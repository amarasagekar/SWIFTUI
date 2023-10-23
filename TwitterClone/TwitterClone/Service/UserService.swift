//
//  UserService.swift
//  TwitterClone
//
//  Created by AMAR on 23/10/23.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                guard let user = try? snapshot?.data(as: User.self) else { return }
            }
    }
    
    func fetchUser(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let document = snapshot?.documents else { return }
                let users = document.compactMap({ try? $0.data(as: User.self)})
                
//                document.forEach{document in
//                    guard let user = try? document.data(as: User.self) else { return }
//                    users.append(user)
//                }
                
                completion(users)
            }
    }
}
