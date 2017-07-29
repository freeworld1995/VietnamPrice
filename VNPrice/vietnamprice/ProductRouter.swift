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
    
    case getAllProduct()
    case getSubProduct()
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getAllProduct, .getSubProduct:
                return .get
            }
        }
        
        // Get URL
        let url: URL = {
            let relativePath: String
            
            switch self {
            case .getAllProduct:
                relativePath = "search/product"
            case .getSubProduct:
                relativePath = "get-all-sub-products"
            }
            
            var url = URL(string: ProductRouter.baseURL)!
            url.appendPathComponent(relativePath)
            return url
        }()
        
        // Set params
        let params: Parameters? = {
            switch self {
            case .getAllProduct, .getSubProduct:
                let params: Parameters = ["l": Language.getCurrentLanguageForRouter()]
                return params
            }
        }()
        
        // Set HTTPBody
        let httpBody: Data? = {
            switch self {
            case .getAllProduct, .getSubProduct:
                return nil
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
        case .getAllProduct, .getSubProduct:
            urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        return try! URLEncoding.default.encode(urlRequest, with: params)
    }
}
