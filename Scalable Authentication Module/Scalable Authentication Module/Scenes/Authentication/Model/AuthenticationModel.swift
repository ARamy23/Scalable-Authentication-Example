//
//  AuthenticationModel.swift
//  Scalable Authentication Module
//
//  Created by Ahmed Ramy on 6/10/20.
//  Copyright © 2020 Ahmed Ramy. All rights reserved.
//

import Foundation
import UIKit.UIViewController

class AuthenticationModel {
    func loginWithEmail(_ email: String, _ password: String, _ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        
    }
    
    func registerWithEmail(_ email: String, _ password: String, _ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        
    }
    
    func loginWithGoogle(_ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        
    }
    
    func loginWithApple(_ context: UIViewController, _ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        let authProvider = AppleAuthStrategy(context)
        let useCase = LoginUseCase(authProvider: authProvider)
        useCase.login(onComplete)
    }
}
