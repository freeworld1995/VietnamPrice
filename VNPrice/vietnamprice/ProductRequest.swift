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
import SCLAlertView

class ProductRequest: CustomAlertView {
    static func getSubProduct(viewController vc: UIViewController, completion: @escaping ([Product])-> ()) {
        Alamofire.request(ProductRouter.getSubProduct()).responseArray { (response: DataResponse<[Product]>) in
            
            switch response.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                showCustomAlert(title: "Error", subTitle: "Something gone wrong", controller: vc, style: .error)
            }
        }
    }
    
    static func getMainProduct(viewController vc: UIViewController, params: [String: Any], completion: @escaping ([ProductPrice]) -> ()) {
        Alamofire.request(ProductRouter.getMainProduct(params)).responseArray { (response: DataResponse<[ProductPrice]>) in
            print("fuck\(response.response?.statusCode)")
            print("dit me\(response.request.debugDescription)")
            switch response.result {
            case .success(let value):
                completion(value)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                showCustomAlert(title: "Error", subTitle: "Something gone wrong", controller: vc, style: .error)
            }
        }
    }
}

