//
//  ViewController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 3..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class CommunityController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        
        let navController = UINavigationController(rootViewController: userProfileController)
        
        navController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        navigationItem.title = "Artly"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        tabBar.tintColor = .black
        
        viewControllers = [navController, UIViewController()]
    }
    
    func handleLogout() {
        let _chageViewController = LoginController();
        present(_chageViewController, animated: true, completion: nil)
    }
}
