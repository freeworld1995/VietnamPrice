//
//  NotiViewController.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/27/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class NotiViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var arrMessages = [MessageDTO]()
    var page = 1
    var isLoadMore = true
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setting(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "setting") as! SettingLanguageViewController
        self.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    

        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 50;
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMessaga()
        
        
        switch Language.getCurrentLanguageName() {
        case "Tiếng Việt":
            self.navigationItem.title? = "THÔNG BÁO"
        case "English":
            self.navigationItem.title? = "NOTIFICATION"
        case "Chinese":
            self.navigationItem.title? = "通知"
            
        default:
            break
        }
    }
    
    func getMessaga (){
         
        Alamofire.request(MessageRouter.getMessage(["page": self.page])).responseArray { [unowned self] (response:DataResponse<[MessageDTO]>) in
            
            switch response.result {
            case .success(let value):
                let count = self.arrMessages.count
                
                for message in value{
                    self.arrMessages.append(message)
                }
                if(count == self.arrMessages.count){
                    self.isLoadMore = false
                }
                else{
                    self.isLoadMore = true
                }
                self.tableView.reloadData()
                
            case .failure(let error):
                print("load question error: \(error.localizedDescription)")
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noticell", for: indexPath) as! NotiTableViewCell
        cell.contentLabel.text = arrMessages[indexPath.row].description!
        cell.contentLabel.sizeToFit()
        cell.timeLabel.text = arrMessages[indexPath.row].createdDate!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
    
        if (indexPath.row == self.arrMessages.count - 1 && self.isLoadMore) {
            page += 1
            getMessaga()
        }
    }
    
    
}
