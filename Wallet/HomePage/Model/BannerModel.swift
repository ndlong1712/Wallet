//
//  BannerModel.swift
//  Wallet
//
//  Created by mac238 on 12/05/2024.
//

import Foundation


class BannerResponseModel: Codable {
    var bannerList: [Banner] = []
    
    enum CodingKeys: String, CodingKey {
        case bannerList
    }
    
}

class Banner: Codable {
    var linkUrl: String = ""
    var adSeqNo: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case linkUrl
        case adSeqNo
    }
    
}

