//
//  ProductRouter.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import Foundation
import Alamofire

let baseURL = ""

enum ProductRouter: URLRequestConvertible {
    static let baseURL = "http://103.237.147.10:8080/api/"
    
    case getMainProduct([String: Any])
    case getSubProduct()
    case getProductById([String: Any])
    case getBannerMessage()
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getSubProduct:
                return .get
            case .getMainProduct, .getProductById ,.getBannerMessage:
                return .post
            }
        }
        
        // Get URL
        let url: URL = {
            let relativePath: String
            
            switch self {
            case .getMainProduct, .getProductById:
                relativePath = "product-price"
            case .getSubProduct:
                relativePath = "get-all-sub-products"
            
            case .getBannerMessage:
                relativePath = "banner-message"
            }
            var url = URL(string: ProductRouter.baseURL)!
            url.appendPathComponent(relativePath)
            return url
        }()
        
        // Set params
        let params: Parameters? = {
            switch self {
            case .getMainProduct, .getSubProduct, .getProductById, .getBannerMessage :
                let params: Parameters = ["l": Language.getCurrentLanguageForRouter()]
                return params
            }
        }()
        
        // Set HTTPBody
        let httpBody: Data? = {
            switch self {
            case .getSubProduct , .getBannerMessage:
                return nil
            case .getProductById(let dict), .getMainProduct(let dict):
                print("di me may \(dict)")
                return try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            }
        }()
        
        // Delete cookies
        let cstorage = HTTPCookieStorage.shared
        if let cookies = cstorage.cookies(for: url) {
            for cookie in cookies {
                cstorage.deleteCookie(cookie)
            }
        }
        
        // Create URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody

        // Add authorization
        switch self {
        case .getMainProduct, .getSubProduct, .getProductById ,.getBannerMessage:
            urlRequest.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        }
        
        
        switch self {
        case .getMainProduct, .getProductById ,.getBannerMessage:
            return try! URLEncoding.queryString.encode(urlRequest, with: params)
        case .getSubProduct:
            return try! URLEncoding.default.encode(urlRequest, with: params)
        }
        
    }
}
