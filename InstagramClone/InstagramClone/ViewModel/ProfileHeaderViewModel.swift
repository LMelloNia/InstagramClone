//
//  ProfileHeaderViewModel.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/09/01.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User

    var fullname: String {
        return user.fullname
    }

    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }

    init(user: User) {
        self.user = user
    }
}
