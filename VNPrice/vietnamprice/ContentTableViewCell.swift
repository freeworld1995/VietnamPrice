//
//  ContentTableViewCell.swift
//  VietNamePrice
//
//  Created by VanQuang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var change: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet weak var buySell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupLanguageForView(self)
        
        let buyLabel = CommonUtils.getAttributeText(inputText: "Mua".localized(), color: .green, font: UIFont.systemFont(ofSize: 17))
        let sellLabel = CommonUtils.getAttributeText(inputText: "/Bán".localized(), color: .red, font: UIFont.systemFont(ofSize: 17))
        buyLabel.append(sellLabel)
        
        buySell.attributedText = buyLabel

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
