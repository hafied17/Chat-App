//
//  ActionSheetViewModel.swift
//  Chat App
//
//  Created by hafied on 09/08/23.
//

import UIKit

struct ActionSheetViewModel {
    
    private let user: User
    
    var options: [ActionSheetOptions] {
        var results = [ ActionSheetOptions]()
        
        if user.isCurrentUser {
            results.append(.delete)
        } else {
            let followOption: ActionSheetOptions = user.isFollowed ? .unFollow(user) : .follow(user)
            results.append(followOption)
        }
        results.append(.report)
//        results.append(.blockUser)
        return results
    }
    
    init(user: User) {
        self.user = user
    }
    
}

enum ActionSheetOptions {
    case follow(User)
    case unFollow(User)
    case report
    case delete
//    case blockUser
    
    var description: String {
        switch self {
        case .follow(let user): return "Follow @\(user.username)"
        case .unFollow(let user): return "Unfollow @\(user.username)"
        case .report: return "Report Tweet"
        case .delete: return "Delete Tweet"
//        case .blockUser: return "Block User"
            
        }
    }
}
