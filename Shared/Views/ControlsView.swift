//
//  Controls.swift
//  Lotus
//
//  Created by Matthew Androus on 4/7/21.
//

import SwiftUI

struct ControlsView: View {
    var body: some View {
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                myTaskManager.lock()
            }) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                Text("Lock")
            }
            Button(action: {
                myTaskManager.unlock()
            }) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                Text("Unlock")
            }
        }
    }
}

struct Controls_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
