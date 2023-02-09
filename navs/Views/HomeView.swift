//
//  HomeView.swift
//  navs
//
//  Created by Yury Vozleev on 06.02.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Home Tab")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Button ("To Home") {
                    rootViewModel.selectedTab = 0
                }
                Button ("To Messages") {
                    rootViewModel.selectedTab = 1
                }
                Button ("To Preferences") {
                    rootViewModel.selectedTab = 2
                }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
