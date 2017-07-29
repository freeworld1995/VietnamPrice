//
//  Language.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

let DEFAULT_LANG_KEY = "DEFAULT_LANG_KEY"
let LANGUAGE_VN = "vi"
let LANGUAGE_ENG = "en"
let LANGUAGE_CHI = "zh-Hans"

struct Language {
    static var bundle: Bundle? = nil
    
    static func get(_ key: String) -> String {
        if (bundle == nil) {
            let language = getCurrentLanguage()
            let filePath = Bundle.main.path(forResource: language, ofType: "lproj")
            bundle = Bundle(path: filePath!)
        }
        
        let result = bundle?.localizedString(forKey: key, value: nil, table: nil)
        return result != nil ? result! : key
    }
    
    static func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: DEFAULT_LANG_KEY)
        UserDefaults.standard.synchronize()
        let filePath = Bundle.main.path(forResource: language, ofType: "lproj")
        bundle = Bundle(path: filePath!)
    }
    
    static func getCurrentLanguageName() -> String {
        if getCurrentLanguage() == LANGUAGE_VN {
            return "Tiếng Việt"
        } else if getCurrentLanguage() == LANGUAGE_ENG {
            return "English"
        } else {
            return "Chinese"
        }
    }
    
    static func getCurrentLanguage() -> String {
        let lang = UserDefaults.standard.object(forKey: DEFAULT_LANG_KEY) as? String
        return lang != nil ? lang! : LANGUAGE_VN
    }
    
}
