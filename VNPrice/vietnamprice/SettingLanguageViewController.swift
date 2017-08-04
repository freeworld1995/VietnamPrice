//
//  SettingLanguageViewController.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

class SettingLanguageViewController: UIViewController {
    
    @IBAction func vietNameClick(_ sender: Any) {
        Language.setLanguage(LANGUAGE_VN)
        NotificationCenter.default.post(name: Notification.Name("subscribe"), object: nil)
        self.dismiss(animated: true, completion: nil)
        reset()
    }

    @IBAction func China(_ sender: Any) {
        Language.setLanguage(LANGUAGE_CHI)
        NotificationCenter.default.post(name: Notification.Name("subscribe"), object: nil)
        self.dismiss(animated: true, completion: nil)
        reset()
    }
    
    @IBAction func englishClick(_ sender: Any) {
        Language.setLanguage(LANGUAGE_ENG)
        NotificationCenter.default.post(name: Notification.Name("subscribe"), object: nil)
        self.dismiss(animated: true, completion: nil)
        reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func reset() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "revealVC") as! SWRevealViewController
        appDelegate.window?.rootViewController?.removeFromParentViewController()
        appDelegate.window?.rootViewController = vc
    }

}
