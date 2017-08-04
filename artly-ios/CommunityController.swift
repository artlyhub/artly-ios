//
//  ViewController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 3..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class CommunityController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Artly"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
    
    func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}

