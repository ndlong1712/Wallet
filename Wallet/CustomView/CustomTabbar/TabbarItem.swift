//
//  TabbarItem.swift
//  Wallet
//
//  Created by mac238 on 11/05/2024.
//

import Foundation
import SwiftUI


enum TabbarItem: Hashable {
    case home, account, location, service
    
    var iconName: String {
        switch self {
        case .home: return "icTabbarHomeActive"
        case .account: return "icTabbarAccountDefault"
        case .location: return "icTabbarLocationActive"
        case .service: return "person.2.fill"
        }
    }
    var title: String {
        switch self {
        case .home: return "Home"
        case .account: return "Account"
        case .location: return "Location"
        case .service: return "Service"
        }
    }
    var color: Color {
        switch self {
        case .home: return .wallet.primaryTone
        case .account: return .wallet.primaryTone
        case .location: return .wallet.primaryTone
        case .service: return .wallet.primaryTone
        }
    }
}
