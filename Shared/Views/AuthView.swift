//
//  AuthView.swift
//  Lotus
//
//  Created by Matthew Androus on 4/7/21.
//

import SwiftUI

struct AuthView: View {
    
    @State private var token: String = "hello"
    var body: some View {
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $token)
            
            Button(action: {
                myAuthManager.UpdateToken(newToken: token)
            }) {
                Text("Authenticate")
            }
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
