//
//  Colors.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import Foundation
import SwiftUI


extension Color {
    static let wallet = Color.WalletColor()
    
    struct WalletColor {
        let mainBackground = Color("mainBg")
        let primaryTone = Color("primaryTone")
        let black = Color("textBlack")
        let gray = Color("textGray")
        let grayDark = Color("textDarkGray")
        let grayRadient = Color("grayRadient")
    }
}

    
enum UrlFirstOpenConstant {
    static let UsdSavingAccount = "https://willywu0201.github.io/data/usdSavings1.json"
    static let UsdFixedDepositedAccount = "https://willywu0201.github.io/data/usdFixed1.json"
    static let UsdDigitalAccount = "https://willywu0201.github.io/data/usdDigital1.json"
    
    static let KhrSavingAccount = "https://willywu0201.github.io/data/khrSavings1.json"
    static let KhrFixedDepositedAccount = "https://willywu0201.github.io/data/khrFixed1.json"
    static let KhrDigitalAccount = "https://willywu0201.github.io/data/khrDigital1.json"
    
    static let BannerAd = "https://willywu0201.github.io/data/banner.json"
    static let Farorite = "https://willywu0201.github.io/data/emptyFavoriteList.json"
    static let Notification = "https://willywu0201.github.io/data/emptyNotificationList.json"
}

enum UrlPullToRefreshConstant {
    static let UsdSavingAccount = "https://willywu0201.github.io/data/usdSavings2.json"
    static let UsdFixedDepositedAccount = "https://willywu0201.github.io/data/usdFixed2.json"
    static let UsdDigitalAccount = "https://willywu0201.github.io/data/usdDigital2.json"
    
    static let KhrSavingAccount = "https://willywu0201.github.io/data/khrSavings2.json"
    static let KhrFixedDepositedAccount = "https://willywu0201.github.io/data/khrFixed2.json"
    static let KhrDigitalAccount = "https://willywu0201.github.io/data/khrDigital2.json"
    
    static let Farorite = "https://willywu0201.github.io/data/favoriteList.json"
    static let Notification = "https://willywu0201.github.io/data/notificationList.json"
}


let PADDING_LEFT: CGFloat = 24
