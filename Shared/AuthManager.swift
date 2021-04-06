//
//  AuthManager.swift
//  Lotus
//
//  Created by Matthew Androus on 4/6/21.
//

import Foundation
let MyAuthManager = AuthManager()

class AuthManager{
    
    var token = "hello"

    func test() {
        print(token)
    }
    
    func lock() {
        print("Lock")
    }
    
    func unlock(){
        print("Unlock")
    }
}



