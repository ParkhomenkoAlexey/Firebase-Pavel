//
//  AuthService.swift
//  IChat
//
//  Created by Алексей Пархоменко on 21.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

enum MyResult {
    case success
    case failure(Error)
}

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
    
        auth.signIn(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (MyResult) -> Void) {
        
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard result != nil else {
                completion(.failure(error!))
                return
            }
            completion(.success)
        }
        
    }
}
