//
//  SplashScreenViewModel.swift
//  navs
//
//  Created by Yury Vozleev on 06.02.2023.
//

import Foundation

class SplashScreenViewModel: ObservableObject {
    
    @Published var isCompleteLoading = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.isCompleteLoading = true
        }
    }
    
}
