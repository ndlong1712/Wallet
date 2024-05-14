//
//  BaseModel.swift
//  Wallet
//
//  Created by mac238 on 12/05/2024.
//

import Foundation

class BaseModel<T: Codable>: Codable, Identifiable {
    var msgCode: String = ""
    var msgContent: String = ""
    var result: T?
    
    enum CodingKeys: String, CodingKey {
          case msgCode
          case msgContent
          case result
    }
}
