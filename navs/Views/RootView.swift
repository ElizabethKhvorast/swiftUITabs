//
//  ContentView.swift
//  navs
//
//  Created by Yury Vozleev on 06.02.2023.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var rootViewModel = RootViewModel()
    
    //@EnvironmentObject var selectedTab: Int
    
    var body: some View {
        TabView (selection: $rootViewModel.selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
                .environmentObject(rootViewModel)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Messages")
                }
                .tag(1)
                .environmentObject(rootViewModel)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Preferences")
                }
                .tag(2)
                .environmentObject(rootViewModel)
            
        }
        .accentColor(.purple)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
