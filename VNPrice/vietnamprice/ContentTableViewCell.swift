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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLanguageForView(self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
