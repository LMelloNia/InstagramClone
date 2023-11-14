//
//  ProfileHeaderViewModel.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/09/01.
//

import UIKit
import Foundation

struct ProfileHeaderViewModel {
    let user: User

    var fullname: String {
        return user.fullname
    }

    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }

    var followButtonText: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }

        return user.isFollowed ? "Following" : "Follow"
    }

    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }

    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }

    init(user: User) {
        self.user = user
    }
}
