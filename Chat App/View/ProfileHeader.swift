//
//  ProfileHeader.swift
//  Chat App
//
//  Created by mbp on 27/01/23.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    required init?(coder: NSCoder) {
        fatalError("Error not implemented")
    }
}
