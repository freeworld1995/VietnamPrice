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
    static let baseURL = "http://103.237.147.10:8080/"
    
    case loginUserByEmail(String, String)
}
