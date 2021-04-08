//
//  AuthManager.swift
//  Lotus
//
//  Created by Matthew Androus on 4/6/21.
//

import Foundation

let myAuthManager = AuthManager()

class AuthManager: ObservableObject{
    
    
    var token = "hello"
    var authHeader = "hello"

    func UpdateToken(newToken: String){
        token = newToken
        authHeader = "Bearer " + token
    }
}



