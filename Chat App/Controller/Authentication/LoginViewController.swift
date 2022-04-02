//
//  LoginViewController.swift
//  Chat App
//
//  Created by VJB-IT on 2/4/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
    }()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    
    // MARK: - Selectors
     
    // MARK: - Helpers
    func configureUI() {

        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
       
        view.addSubview(logoImage)
        logoImage.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImage.setDimensions(width: 150, height: 150)

    }
}
