//
//  MainHomeController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 12..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class MainHomeController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let communityController = CommunityController(collectionViewLayout: layout)
        let communityNavController = UINavigationController(rootViewController: communityController)
        communityNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_home")
        
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let userProfileNavController = UINavigationController(rootViewController: userProfileController)
        userProfileNavController.tabBarItem.image = #imageLiteral(resourceName: "profile_selected")
        
        let auctionController = AuctionController(collectionViewLayout: layout)
        let auctionNavController = UINavigationController(rootViewController: auctionController)
        auctionNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_attach_money")
        
        let searchController = SearchController(collectionViewLayout: layout)
        let searchNavController = UINavigationController(rootViewController: searchController)
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_search")
        
        let cloudFundController = CloudFundController(collectionViewLayout: layout)
        let cloudFundNavController = UINavigationController(rootViewController: cloudFundController)
        cloudFundNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_cloud")
        
        tabBar.tintColor = .black
        viewControllers = [communityNavController, searchNavController,
        cloudFundNavController, auctionNavController, userProfileNavController]
        
        let logoImage = UIImageView(image: #imageLiteral(resourceName: "artlyLogo"))
        logoImage.frame = CGRect(x: 0, y: 0, width: 38, height: 38)
        logoImage.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoImage
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_create"), style: .plain, target: self, action: #selector(handleCreate))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_message"), style: .plain, target: self, action: #selector(handleMessage))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
    func handleMessage() {
        let _chageViewController = LoginController();
        present(_chageViewController, animated: true, completion: nil)
    }
    
    func handleCreate() {
        let _chageViewController = LoginController();
        present(_chageViewController, animated: true, completion: nil)
    }

}
