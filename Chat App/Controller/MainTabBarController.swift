//
//  MainTabBarController.swift
//  Chat App
//
//  Created by VJB-IT on 12/2/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - Property
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    // MARK: - Helper
    
    func configureViewController() {
        let feed = FeedController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")
        
        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")
        
        let notifications = NotificationsController()
        notifications.tabBarItem.image = UIImage(named: "search_unselected")
        
        let conversations = ConversationsController()
        conversations.tabBarItem.image = UIImage(named: "search_unselected")

        viewControllers = [feed, explore, notifications, conversations]
    }


}
