//
//  MessageDTO.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit
import ObjectMapper

class MessageDTO: Mappable {
    var id: Int?
    var description: String?
    var createdDate: String?
    var userId: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        description <- map["description"]
        createdDate <- map["createdDate"]
        userId <- map["userId"]
    }
    
    init() {
        id = 0
        description = ""
        createdDate = ""
        userId = ""
    }

}
