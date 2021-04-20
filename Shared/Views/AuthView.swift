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
            Spacer()
            Text("Your Token Status")
            Text(myAuthManager.TokenSatus())
            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $token)
            
            Button(action: {
                myAuthManager.UpdateToken(newToken: token)
            }) {
                Text("Update Token")
            }
            Spacer()
            Button(action: {
                myAuthManager.UpdateToken(newToken: "no-token")
            }) {
                Text("Clear Token")
            }
            Spacer()
            
        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
