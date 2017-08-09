//
//  SignUpController.swift
//  artly-ios
//
//  Created by Yumin Park on 2017. 8. 4..
//  Copyright © 2017년 Yumin Park. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("가입하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 150, g: 150, b: 150), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor(r: 150, g: 150, b: 150).cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return button
    }()
    
    func registerBtnPressed(sender : UIButton) {
        let parameters = ["username": nameTextField.text, "last_name": lastNameTextField.text, "first_name": firstNameTextField.text, "email": emailTextField.text]
        guard let url = URL(string: "https://www.artlyhub.com/api/user/") else { return }
        
        //같은 name있는지 확인
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    for dictionaty in json as! [[String: AnyObject]] {
                        if(self.nameTextField.text == dictionaty["username"] as? String) {
                            print("Exist same name in DataBase.")
                            return
                        }
                    }
                } catch let jsonError {
                    print(jsonError)
                }
            }
        }
        session.resume()

        
        //서버에 등록
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return }
        request.httpBody = httpBody
        
        let sessionRegister = URLSession.shared
        sessionRegister.dataTask(with: request) {
            (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.tintColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        setupLabelView()
        setupTextFieldView()
        setupButton()
    }
    
    func handleBackSpace() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    func setupButton() {
        
    }
    
    func setupLabelView() {
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTextFieldView() {
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5).isActive = true
        firstNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 5).isActive = true
        lastNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 5).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
