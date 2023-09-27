//
//  UserCellViewModel.swift
//  InstagramClone
//
//  Created by 김시훈 on 2023/09/23.
//

import Foundation

struct UserCellViewModel {
    
    private let user: User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var username: String {
        return user.username
    }
    
    var fullname: String {
        return user.fullname
    }
    
    init (user: User) {
        self.user = user
    }
}
