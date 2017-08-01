//
//  ViewController.swift
//  vietnamprice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var banner: UILabel!
    
    
    var isPresentingSubProducts = false {
        didSet {
            if isPresentingSubProducts {
                menuButton.image = #imageLiteral(resourceName: "ic_back")
            } else {
                menuButton.image = #imageLiteral(resourceName: "icon_30x30")
            }
        }
    }
    
    @IBAction func notification(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "notification") as! NotiViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func setting(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingLanguageViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    var SubProducts = [Product]()
    var MainProducts = [ProductPrice]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLanguageForView(view)
        slideMenu()
        
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Alamofire.request(ProductRouter.getBannerMessage()).responseJSON { (response) in
            if let json = response.result.value as? [String: Any] {
                self.banner.text = json["description"] as? String
            }
        }
    
    }
    func loadData() {
        let params: Parameters = ["createdDate": "29/07/2017"]
        
        ProductRequest.getMainProduct(viewController: self, params: params) { (result) in
            self.MainProducts = result
            self.tableView.reloadData()
        }
        
        ProductRequest.getSubProduct(viewController: self) { (result) in
            self.SubProducts = result
            self.collectionView.reloadData()
        }
    }
    
    func slideMenu() {
        if ( revealViewController() != nil ){
            menuButton.target = revealViewController()
            menuButton.action = #selector(self.showSlideMenu(_:))
            revealViewController().rearViewRevealWidth = 270
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func showSlideMenu(_ sender: SWRevealViewController) {
        if !isPresentingSubProducts {
            _ = SWRevealViewController.revealToggle(_:)
        } else {
            loadData()
            isPresentingSubProducts = false
        }
    }
    
    func showSubProducts(_ product: ProductPrice) {
        let params: [String: Any] = ["createdDate": CommonUtils.getCurrentDayMonthYear(), "productId": product.productId!]
        
        ProductRequest.getProductById(viewController: self, params: params) { (result) in
            self.isPresentingSubProducts = true
            self.MainProducts.removeAll()
            self.MainProducts = result
            self.tableView.reloadData()
        }
    }
}

// MARK: Tableview datasource, delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentcell", for: indexPath) as! ContentTableViewCell
        let product = MainProducts[indexPath.row]
        cell.name.text = product.productName
        cell.price.text = product.formatedPrice
        cell.change.text = product.diff
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let product = MainProducts[indexPath.row]
        
        if !isPresentingSubProducts {
            showSubProducts(product)
        } else {
            print("Show chart")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: Collectionview datasource, delegate
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SubProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath) as! ProductCollectionViewCell
        cell.nameProduct.text  = SubProducts[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 50)
    }
}

