//
//  User.swift
//  Chat App
//
//  Created by VJB-IT on 26/4/22.
//

import Foundation

struct User {
    let email: String
    let fullName: String
    var profileImageUrl: URL?
    let username: String
    let uid: String
    
    init(uid: String, dictionary: [String: AnyObject]){
        self.uid = uid
        
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        
        if let profileImageUrlString = dictionary["profileImage"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}
