//
//  AppleAuthStrategy.swift
//  Scalable Authentication Module
//
//  Created by Ahmed Ramy on 6/10/20.
//  Copyright © 2020 Ahmed Ramy. All rights reserved.
//

import Foundation
import AuthenticationServices

class AppleAuthStrategy: NSObject, LoginableAuthProvider {
    
    private let context: UIViewController
    private var onLoginComplete: ((Result<Void, Error>) -> Void)?
    
    init(_ context: UIViewController) {
        self.context = context
    }
    
    func login(_ onComplete: @escaping ((Result<Void, Error>) -> Void)) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self.context as? ASAuthorizationControllerPresentationContextProviding
        authorizationController.performRequests()
        self.onLoginComplete = onComplete
    }
}

extension AppleAuthStrategy: ASAuthorizationControllerDelegate {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.context.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        self.onLoginComplete?(.success(()))
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.onLoginComplete?(.failure(error))
    }
}
