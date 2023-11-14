//
//  UserService.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/09/01.
//

import Firebase
import FirebaseFirestore

typealias FirestoreComplition = (Error?) -> Void

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

    static func follow(uid: String, complition: @escaping (FirestoreComplition)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        COLLERTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { error in
            COLLERTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: complition)
        }
    }

    static func unfollow(uid: String, complition: @escaping (FirestoreComplition)) {
        
    }
}
