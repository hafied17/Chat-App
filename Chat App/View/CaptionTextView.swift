//
//  CaptionTextView.swift
//  Chat App
//
//  Created by VJB-IT on 27/4/22.
//

import Foundation
import UIKit

class CaptionTextView: UITextView {
    
    // MARK: - Properties
    
    let placeholderLebel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What's happening?"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        textColor = .black
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        addSubview(placeholderLebel)
        placeholderLebel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 4)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange),name: UITextView.textDidChangeNotification, object: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTextInputChange() {
        placeholderLebel.isHidden = true
    }
}
