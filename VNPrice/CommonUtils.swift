//
//  CommonUtils.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/30/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import Foundation

class CommonUtils {
    static func getCurrentDayMonthYear() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: currentDate)
    }
}
