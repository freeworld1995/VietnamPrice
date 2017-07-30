//
//  IntegrateAlertView.swift
//  VietNamePrice
//
//  Created by Jimmy Hoang on 7/30/17.
//  Copyright © 2017 VanQuang. All rights reserved.
//

import SCLAlertView

protocol IntegrateAlertView {
    func showAlert(title: String, subTitle: String, style: SCLAlertViewStyle)
}

protocol CustomAlertView {
    static func showCustomAlert(title: String, subTitle: String, controller: UIViewController, style: SCLAlertViewStyle)
}

extension CustomAlertView {
    static func showCustomAlert(title: String, subTitle: String, controller: UIViewController, style: SCLAlertViewStyle) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
        let alert = SCLAlertView(appearance : appearance)
        
        switch style {
        case .success:
            alert.addButton("OK") { controller.dismiss(animated: true) }
            alert.showSuccess(title, subTitle: subTitle)
        case .error:
            alert.addButton("OK") { alert.dismiss(animated: true) }
            alert.showError(title, subTitle: subTitle)
        case .notice:
            alert.addButton("OK") { alert.dismiss(animated: true) }
            alert.showNotice(title, subTitle: subTitle)
        case .warning:
            alert.addButton("OK") { alert.dismiss(animated: true) }
            alert.showWarning(title, subTitle: subTitle)
        case .info:
            alert.addButton("OK") { alert.dismiss(animated: true) }
            alert.showInfo(title, subTitle: subTitle)
        case .wait:
            alert.addButton("OK") { alert.dismiss(animated: true) }
            alert.showWait(title, subTitle: subTitle)
        case .edit:
            alert.addButton("OK") { alert.dismiss(animated: true) }
            alert.showEdit(title, subTitle: subTitle)
        }

    }
}

extension IntegrateAlertView where Self: UIViewController {
    func showAlert(title: String, subTitle: String, style: SCLAlertViewStyle) {
        let alert = SCLAlertView()
        
        switch style {
        case .success:
            alert.showSuccess(title, subTitle: subTitle)
        case .error:
            alert.showError(title, subTitle: subTitle)
        case .notice:
            alert.showNotice(title, subTitle: subTitle)
        case .warning:
            alert.showWarning(title, subTitle: subTitle)
        case .info:
            alert.showInfo(title, subTitle: subTitle)
        case .wait:
            alert.showWait(title, subTitle: subTitle)
        case .edit:
            alert.showEdit(title, subTitle: subTitle)
        }
    }
}
