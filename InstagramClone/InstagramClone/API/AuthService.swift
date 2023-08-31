//
//  AuthService.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/08/31.
//

import UIKit
import Firebase
import FirebaseFirestore

struct Authcredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func logUserIn(withEmail email: String, password: String, completaion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completaion)

    }

    static func registerUser(withCredential credentials: Authcredentials, completion: @escaping (Error?) -> Void) {
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }

                guard let uid = result?.user.uid else { return }

                let data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid,
                                           "username": credentials.username
                ]

                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
}
