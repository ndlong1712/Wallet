//
//  WalletApp.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import SwiftUI

@main
struct WalletApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView(viewModel: HomePageViewModel())
        }
    }
}
