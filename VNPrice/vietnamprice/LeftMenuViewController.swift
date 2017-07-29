//
//  LeftMenuViewController.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    let arrImage = ["icon_30x302","icon_30x303","icon_30x306","icon_30x307","icon_30x308"]
    let arrContent = ["Thông báo".localized(), "Cài đặt".localized(), "Đăng nhập".localized(), "Đổi mật khẩu".localized(), "Đăng xuất".localized()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLanguageForView(view)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! LeftMenuTableViewCell
        cell.img.image = UIImage.init(named: arrImage[indexPath.row])
        cell.content.text = "\(arrContent[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
           
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "notification") as! NotiViewController
            let navController = UINavigationController(rootViewController: vc) // Creating a navigation controller with VC1 at the root of the navigation stack.
            navController.navigationBar.barTintColor = UIColor.black
            navController.navigationBar.barStyle = .black
            navController.navigationBar.tintColor = UIColor.white
            navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
            navController.navigationBar.isTranslucent = false;
            self.present(navController, animated:true, completion: nil)
           
            break
            
        case 1:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingLanguageViewController
            self.present(vc, animated: true, completion: nil)
            break
            
        case 2:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
            self.present(vc, animated: true, completion: nil)
            break
            
        case 3:
            break
            
        case 4:
            break
            
        default:
            break
        }
    }
    
   
}
