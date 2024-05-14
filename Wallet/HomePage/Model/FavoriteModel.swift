//
//  FavoriteModel.swift
//  Wallet
//
//  Created by mac238 on 13/05/2024.
//

import Foundation

class FavoriteItem: Codable, Identifiable {
    var id = UUID()
    var nickname: String = ""
    var transType: String = ""
    
    func iconName() -> String {
        if transType == "Mobile" {
            return "ElementScrollMobile"
        } else if transType == "CUBC" {
            return "ElementScrollTree"
        } else if transType == "PMF" {
            return "ElementScrollBuilding"
        } else if transType == "CreditCard" {
            return "ElementScrollCreditCard"
        }
        return "ElementScrollEmpty"
    }
    
    enum CodingKeys: String, CodingKey {
        case nickname
        case transType
    }
    
}

class FavoriteResponseModel: Codable {
    var favoriteList: [FavoriteItem] = []
    
    enum CodingKeys: String, CodingKey {
        case favoriteList
    }
    
}
