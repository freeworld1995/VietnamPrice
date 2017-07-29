//
//  LanguageManager.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/29/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import UIKit

protocol LanguageSetup {
    func setupLanguageForView(_ parentView: UIView)
}

extension LanguageSetup {
    func setupLanguageForView(_ parentView: UIView) {
        for view in parentView.subviews {
            if view is UILabel {
                let label = view as! UILabel
                label.text = label.text?.localized()
            }
            else if view is UITextField {
                let textField = view as! UITextField
                textField.placeholder = textField.placeholder?.localized()
            }
            else if view is UIButton {
                let button = view as! UIButton
                button.setTitle(button.titleLabel?.text?.localized(), for: .normal)
            }
            else {
                setupLanguageForView(view)
            }
        }
    }
}

extension UIViewController: LanguageSetup {}
extension UIView: LanguageSetup {}
