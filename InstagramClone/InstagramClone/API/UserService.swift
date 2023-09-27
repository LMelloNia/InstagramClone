//
//  UserService.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/09/01.
//

import Firebase
import FirebaseFirestore

struct UserService {
    static func fetchUser(completion: @escaping (User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }

    static func fetchUsers(completion: @escaping ([User]) -> Void) {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let snapshot else { return }
            
            let users = snapshot.documents.map({ User(dictionary: $0.data())})
            completion(users)
        }
    }
}