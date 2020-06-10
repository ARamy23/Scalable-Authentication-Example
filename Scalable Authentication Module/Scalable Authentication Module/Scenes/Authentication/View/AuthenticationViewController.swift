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
    
    private func handleAuthentication() -> ((Result<Void, Error>) -> Void) {
        return { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                // Go to Profile
                break
            case .failure(_):
                // Show Error
                break
            }
        }
    }
    
    @IBAction func loginWithEmail(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        model.loginWithEmail(email, password, handleAuthentication())
    }
    
    @IBAction func registerWithEmail(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        model.registerWithEmail(email, password, handleAuthentication())
    }
    
    @IBAction func loginWithGoogle(_ sender: Any) {
        model.loginWithGoogle(handleAuthentication())
    }
    
    @IBAction func loginWithApple(_ sender: Any) {
        model.loginWithApple(handleAuthentication())
    }
}
