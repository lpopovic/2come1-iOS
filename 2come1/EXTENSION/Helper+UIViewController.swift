//
//  Helper+UIViewController.swift
//  2come1
//
//  Created by MacBook on 3/5/20.
//

import Foundation
import UIKit

extension UIAlertController {
    static func createCustomAlert(_ vc:UIViewController, _ title: String, _ message: String, _ actions:[UIAlertAction]){
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        for action in actions {
            alert.addAction(action)
        }
        
        vc.present(alert, animated: true, completion: nil)
        
    }
}
