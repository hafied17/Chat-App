//
//  FeedController.swift
//  Chat App
//
//  Created by VJB-IT on 12/2/22.
//

import UIKit

class FeedController: UIViewController {

    // MARK: - Property
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper
        
    func configureUI() {
        view.backgroundColor = .white
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView

    }

}
