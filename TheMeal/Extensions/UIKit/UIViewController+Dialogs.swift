//
//  UIViewController+Dialogs.swift
//  TheMeal
//
//  Created by Gastón Sobrevilla on 26/09/2020.
//  Copyright © 2020 Gastón Sobrevilla. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Default configuration

public class DialogsConfig {
    
    public var defaultOkButtonText: String
    public var defaultCancelButtonText: String
    
    static public let instance = DialogsConfig()
    
    private init() {
        defaultOkButtonText = "OK"
        defaultCancelButtonText = "Cancel"
    }
}

// MARK: - Ok Dialogs

extension UIViewController {
    
    /// Shows an alert with a single button
    func showOkDialog(title: String?, message: String?, buttonText: String, buttonCallback: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: buttonCallback))
        present(alert, animated: true, completion: nil)
    }
    
    /// Shows an alert with a single button
    func showOkDialog(title: String?, message: String?, buttonText: String) {
        
        showOkDialog(title: title, message: message, buttonText: buttonText, buttonCallback: nil)
    }
    
    /// Shows an alert with a single button
    func showOkDialog(title: String?, message: String?, buttonCallback: ((UIAlertAction) -> Void)?) {
        
        showOkDialog(title: title, message: message, buttonText: DialogsConfig.instance.defaultOkButtonText, buttonCallback: buttonCallback)
    }
    
    /// Shows an alert with a single button
    func showOkDialog(title: String?, message: String?) {
        
        showOkDialog(title: title, message: message, buttonText: DialogsConfig.instance.defaultOkButtonText, buttonCallback: nil)
    }
}
