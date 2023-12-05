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

    var numberOfFollowers: NSAttributedString {
        return attributedStartText(value: user.stats.followers, label: "followers")
    }

    var numberOfFollowing: NSAttributedString {
        return attributedStartText(value: user.stats.following, label: "following")
    }

    var numnberOfPosts: NSAttributedString {
        return attributedStartText(value: user.stats.posts, label: "posts")

    }

    init(user: User) {
        self.user = user
    }

    func attributedStartText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return attributedText
    }
}
