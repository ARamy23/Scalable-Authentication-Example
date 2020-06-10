//
//  AuthenticationViewController.swift
//  Scalable Authentication Module
//
//  Created by Ahmed Ramy on 6/10/20.
//  Copyright © 2020 Ahmed Ramy. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    lazy var model = AuthenticationModel()
    
    @IBAction func loginWithEmail(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        model.loginWithEmail(email, password)
    }
    
    @IBAction func registerWithEmail(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        model.registerWithEmail(email, password)
    }
    
    @IBAction func loginWithGoogle(_ sender: Any) {
        model.loginWithGoogle()
    }
    
    @IBAction func loginWithApple(_ sender: Any) {
        model.loginWithApple()
    }
}
