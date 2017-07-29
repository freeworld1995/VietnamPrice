//
//  SignUpViewController.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var username: UITextField!
    
    @IBOutlet var phoneNumber: UITextField!
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var passCode: UITextField!
    
    @IBOutlet var passCode1: UITextField!

    
    @IBAction func signUp(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
