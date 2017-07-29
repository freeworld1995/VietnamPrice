//
//  SubProduct.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: Mappable {
    var id: Int?
    var name: String?
    var createdDate: String?
    var locale: String?
    var parentId: String?
    var parentProduct: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        createdDate <- map["createdDate"]
        locale <- map["locale"]
        parentId <- map["parentId"]
        parentProduct <- map["parentProduct"]
    }
    
    init() {
        id = 0
        name = ""
        createdDate = ""
        locale = ""
        parentId = ""
        parentProduct = ""
    }
}
