//
//  ProductRequest.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ProductRequest {
    static func getSubProduct(completion: @escaping ([Product])-> ()) {
        Alamofire.request(ProductRouter.getSubProduct()).responseArray { (response: DataResponse<[Product]>) in
            
            switch response.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                print(error)
            }
            
            
        }
    }
}

