//
//  MainView.swift
//  Lotus
//
//  Created by Matthew Androus on 4/7/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            AuthView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            ControlsView()
                .tabItem {
                    Label("Controls", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Account())
        
    }
}

//qts-6aea5426219af0d8a28da1c59ff8c133b74341f153a4cd7128dc97f94430c0a2
