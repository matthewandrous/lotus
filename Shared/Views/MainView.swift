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
        MainView().environmentObject(AuthManager())
        
    }
}
