//
//  SignUpController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 4..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    let nameLabel: UILabel = {
        let tf = UILabel()
        return tf
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailLabel: UILabel = {
        let tf = UILabel()
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let tf = UILabel()
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBackSpace))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        
        setupLabelView()
        setupTextFieldView()
    }
    
    func handleBackSpace() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    func setupLabelView() {
        
    }
    
    func setupTextFieldView() {
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
