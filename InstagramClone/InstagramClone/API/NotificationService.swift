//
//  NotificationService.swift
//  InstagramClone
//
//  Created by 김시훈 on 12/18/23.
//

import Firebase

struct NotificationService {

    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard uid != currentUid else { return }

        let docRef = COLLECTION_NOTIFICATIONS.document(uid).collection("user-nitifications").document()

        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "uid": currentUid,
                                   "type": type.rawValue,
                                   "id": docRef.documentID]

        if let post {
            data["postid"] = post.postId
            data["postImageUrl"] = post.imageUrl
        }

        docRef.setData(data)
    }

    static func fetchNotification() {
        
    }
}
