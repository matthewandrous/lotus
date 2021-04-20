//
//  AuthManager.swift
//  Lotus
//
//  Created by Matthew Androus on 4/6/21.
//

import Foundation
import Security


let myAuthManager = AuthManager()

class AuthManager: ObservableObject{
    var token = "hello"
    var authHeader = "hello"
    
    init(){
        authHeader = "Bearer " + (KeychainWrapper.standard.string(forKey: "Token") ?? "no-token")
    }
    

    
    func UpdateToken(newToken: String){
        KeychainWrapper.standard.set(newToken, forKey: "Token")
        authHeader = "Bearer " + (KeychainWrapper.standard.string(forKey: "Token") ?? "no-token")
    }
    
    func TokenSatus() -> String{
        let status = KeychainWrapper.standard.string(forKey: "Token") ?? "no-token"
        if (status == "no-token"){
            return "No Token Stored"
        } else {
            return "Token is " + status
        }
    }
    
}



