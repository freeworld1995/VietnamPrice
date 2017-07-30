//
//  Product.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductPrice: Mappable {
    var id: Int?
    var productId: Int?
    var productName: String?
    var created_date: String?
    var price: Float?
    var percent: String?
    var isParent: Bool?
    var formatedPrice: String?
    var diff: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        productId <- map["productId"]
        productName <- map["productName"]
        price <- map["price"]
        percent <- map["percent"]
        isParent <- map["isParent"]
        formatedPrice <- map["formatedPrice"]
        diff <- map["diff"]
    }
    
    init() {
        id = 0
        productId = 0
        productName = ""
        created_date = ""
        price = 0.0
        percent = ""
        isParent = false
        formatedPrice = ""
        diff = ""
    }
}
