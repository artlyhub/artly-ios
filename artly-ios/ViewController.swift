//
//  ViewController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 3..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    func handleLogout() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
}

