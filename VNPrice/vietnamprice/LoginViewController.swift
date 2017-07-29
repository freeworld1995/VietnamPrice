//
//  LoginViewController.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var userName: UITextField!

    @IBOutlet var passCode: UITextField!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func forgetPassCode(_ sender: Any) {
    }
    
    @IBAction func loginFacebook(_ sender: Any) {
        
    }
    
    @IBAction func signInWechat(_ sender: Any) {
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
       
    }
    
    func dismissKeyboard() {
    
        view.endEditing(true)
    }
   
}
