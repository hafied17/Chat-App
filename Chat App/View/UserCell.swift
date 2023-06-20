//
//  UserCell.swift
//  Chat App
//
//  Created by mbp on 19/06/23.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - Properties
    
    var user: User? {
        didSet { configure() }
    }
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 32, height: 32)
        iv.layer.cornerRadius = 32/2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let fullnameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "fulname"
        return label
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "username"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
        let stack = UIStackView(arrangedSubviews: [usernameLabel, fullnameLabel])
        stack.axis = .vertical
        stack.spacing = 2
        
        addSubview(stack)
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let user = user else { return }
        
        profileImageView.sd_setImage(with: user.profileImageUrl)
        
        usernameLabel.text = user.username
        fullnameLabel.text = user.fullName
    }
}
