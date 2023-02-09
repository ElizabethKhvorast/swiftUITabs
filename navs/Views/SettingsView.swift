//
//  SettingsView.swift
//  navs
//
//  Created by Елизавета Хворост on 08.02.2023.
//

import SwiftUI

struct SettingsView: View
{
    @EnvironmentObject var rootViewModel: RootViewModel
    
    let settingsItems = [
            "Screen",
            "Battery",
            "Sound",
            "Notifications"]
    
    var body: some View {
        NavigationStack {
            List(settingsItems, id: \.self) { setting in
                NavigationLink(setting, value: setting)
            }
            .navigationDestination(for: String.self, destination: SettingsItemView.init)
            .navigationTitle("Preferences")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SettingsItemView: View {
    let name: String

    var body: some View {
        NavigationView {
            Text("Selected setting: \(name)")
                .font(.largeTitle)
        }
        .navigationTitle(name)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
