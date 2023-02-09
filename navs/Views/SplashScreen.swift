//
//  SplashScreen.swift
//  navs
//
//  Created by Yury Vozleev on 06.02.2023.
//

import SwiftUI

struct SplashScreen: View {
    @ObservedObject var viewModel = SplashScreenViewModel()
    
    var body: some View {
        ProgressView().progressViewStyle(.circular)
            .fullScreenCover(isPresented: $viewModel.isCompleteLoading) {
                RootView()
            }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
