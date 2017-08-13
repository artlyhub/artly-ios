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
        
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let userProfileNavController = UINavigationController(rootViewController: userProfileController)
        userProfileNavController.tabBarItem.image = #imageLiteral(resourceName: "profile_selected")
        
        let communityController = CommunityController(collectionViewLayout: layout)
        let communityNavController = UINavigationController(rootViewController: communityController)
        communityNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_home")
        
        let auctionController = AuctionController(collectionViewLayout: layout)
        let auctionNavController = UINavigationController(rootViewController: auctionController)
        auctionNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_attach_money")
        
        let searchController = SearchController(collectionViewLayout: layout)
        let searchNavController = UINavigationController(rootViewController: searchController)
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_search")
        
        let cloudFundController = CloudFundController()
        cloudFundController.tabBarItem.image = #imageLiteral(resourceName: "ic_cloud")
        let cloudFundNavController = UINavigationController(rootViewController: cloudFundController)
        cloudFundNavController.tabBarItem.image = #imageLiteral(resourceName: "ic_cloud")
        
        tabBar.tintColor = .black
        viewControllers = [communityNavController, searchNavController,
        cloudFundNavController, auctionNavController, userProfileNavController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}
