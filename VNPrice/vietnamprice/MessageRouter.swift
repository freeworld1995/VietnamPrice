//
//  MessageRouter.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

enum MessageRouter: URLRequestConvertible {
    static let baseURL = "http://103.237.147.10:8080/api/"
    
    case getMessage([String: Any])
    func asURLRequest() throws -> URLRequest {
        
        
        var method: HTTPMethod {
            return .post

        }
        
        let url: URL = {
            let relativePath = "messages"
            var url = URL(string: MessageRouter.baseURL)!
            url.appendPathComponent(relativePath)
            return url
        }()
        
        let cstorage = HTTPCookieStorage.shared
        if let cookies = cstorage.cookies(for: url) {
            for cookie in cookies {
                cstorage.deleteCookie(cookie)
            }
        }
        
        
        let params: Parameters? = {
            let params: Parameters = ["l": Language.getCurrentLanguageForRouter()]
            return params
        }()
        
        
        let httpBody: Data? = {
            switch self {
            case .getMessage(let dict):
                return try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            }
        }()
        
        
        
        // Create URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody

        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        
//        let encoding = URLEncoding.default
        
        return try! URLEncoding.queryString.encode(urlRequest, with: params)
            
    }
}
