//
//  NotificationListModel.swift
//  Wallet
//
//  Created by mac238 on 13/05/2024.
//

import Foundation

class NotificationObject: Codable {
    var status = false
    var updateDateTime = ""
    var title = ""
    var message = ""
    
    enum CodingKeys: String, CodingKey {
        case status
        case updateDateTime
        case title
        case message
    }
    
}

class NotificationResponseModel: Codable {
    var messages: [NotificationObject] = []
    
    enum CodingKeys: String, CodingKey {
        case messages
    }
}
