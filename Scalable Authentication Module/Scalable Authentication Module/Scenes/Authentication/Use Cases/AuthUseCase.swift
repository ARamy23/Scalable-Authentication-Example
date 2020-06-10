//
//  AuthUseCase.swift
//  Scalable Authentication Module
//
//  Created by Ahmed Ramy on 6/10/20.
//  Copyright © 2020 Ahmed Ramy. All rights reserved.
//

import Foundation

protocol LoginableAuthProvider {
    func login()
}

protocol LogoutableAuthProvider {
    func logout()
}

protocol RegisterableAuthProvider {
    func register()
}

protocol AuthProvider: LoginableAuthProvider, LogoutableAuthProvider, RegisterableAuthProvider { }

class AuthUseCase {
    private let authProvider: AuthProvider
    
    init(authProvider: AuthProvider) {
        self.authProvider = authProvider
    }
    
    func login() {
        authProvider.login()
    }
    
    func register() {
        authProvider.register()
    }
    
    func logout() {
        authProvider.logout()
    }
}
