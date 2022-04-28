//
//  TweetCell.swift
//  Chat App
//
//  Created by VJB-IT on 28/4/22.
//

import Foundation
import UIKit

class TweetCell: UICollectionViewCell{
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
