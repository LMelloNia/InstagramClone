//
//  NotificationViewModel.swift
//  InstagramClone
//
//  Created by 김시훈 on 12/19/23.
//

import UIKit

struct NotificationViewModel {
    private let notification: Notification

    init(notification: Notification) {
        self.notification = notification
    }

    var postImageUrl: URL? {
        return URL(string: notification.postImageUrl ?? "")
    }

    var profileImageUrl: URL? {
        return URL(string: notification.userProfileImageUrl)
    }
}
