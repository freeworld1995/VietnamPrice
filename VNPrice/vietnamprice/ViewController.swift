//
//  ViewController.swift
//  vietnamprice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func notification(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "notification") as! NotiViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func setting(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingLanguageViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLanguageForView(view)
        slideMenu()
    }

    func slideMenu(){
        if ( revealViewController() != nil ){
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 270
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    //tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "contentcell", for: indexPath) as! ContentTableViewCell
            return cell
            
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath) as! ProductCollectionViewCell
        cell.nameProduct.text  = "THEP CONG NGHIEP"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 50)
    }
}

