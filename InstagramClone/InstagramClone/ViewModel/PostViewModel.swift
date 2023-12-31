//
//  PostViewModel.swift
//  InstagramClone
//
//  Created by 김시훈 on 12/5/23.
//

import UIKit

struct PostViewModel {
    var post: Post

    var imageUrl: URL? { return URL(string: post.imageUrl) }

    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl) }

    var username: String { return post.ownerUsername }

    var caption: String { return post.caption }

    var likes: Int { return post.likes }

    var likeButtonTintColor: UIColor {
        return post.didLike ? .red : .black
    }

    var likeButtonImage: UIImage? {
        let imageName = post.didLike ? "like_selected" : "like_unselected"
        return UIImage(named: imageName)
    }

    var liesLabelText: String {
        if post.likes != 1 {
            return "\(post.likes) likes"
        } else {
            return "\(post.likes) like"
        }
    }

    init(post: Post) {
        self.post = post
    }
}
