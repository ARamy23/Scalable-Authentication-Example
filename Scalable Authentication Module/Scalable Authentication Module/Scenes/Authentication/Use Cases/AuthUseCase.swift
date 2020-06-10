//
//  AuthUseCase.swift
//  Scalable Authentication Module
//
//  Created by Ahmed Ramy on 6/10/20.
//  Copyright © 2020 Ahmed Ramy. All rights reserved.
//

import Foundation

protocol LoginableAuthProvider {
    func login(_ onComplete: @escaping ((Result<Void, Error>) -> Void))
}

protocol LogoutableAuthProvider {
    func logout(_ onComplete: @escaping ((Result<Void, Error>) -> Void))
}

protocol RegisterableAuthProvider {
    func register(_ onComplete: @escaping ((Result<Void, Error>) -> Void))
}

class LoginUseCase {
    private let authProvider: LoginableAuthProvider
    
    init(authProvider: LoginableAuthProvider) {
        self.authProvider = authProvider
    }
    
    func login(_ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        authProvider.login(onComplete)
    }
}

class RegisterUseCase {
    private let authProvider: RegisterableAuthProvider
    
    init(authProvider: RegisterableAuthProvider) {
        self.authProvider = authProvider
    }
    
    func register(_ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        authProvider.register(onComplete)
    }
}

class LogoutUseCase {
    private let authProvider: LogoutableAuthProvider
    
    init(authProvider: LogoutableAuthProvider) {
        self.authProvider = authProvider
    }
    
    func logout(_ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        authProvider.logout(onComplete)
    }
}
