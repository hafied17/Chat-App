//
//  NotificationsController.swift
//  Chat App
//
//  Created by VJB-IT on 12/2/22.
//

import UIKit

class NotificationsController: UIViewController {

    // MARK: - Property
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper
        
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notification"
    
    }
}
