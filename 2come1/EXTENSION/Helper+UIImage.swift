//
//  Helper+UIImage.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//

import Foundation
import UIKit

enum TabBarIcon {
    case
    around,
    chat,
    match,
    profile
    
    var value: UIImage {
        switch self {
        case .around:
            return UIImage(named: "icon-nearby")!
        case .chat:
            return UIImage(named: "icon-chat")!
        case .match:
            return UIImage(named: "icon-match")!
        case .profile:
            return UIImage(named: "icon-profile")!
        }
    }
}

enum customImages {
    case
    jin
    
    var value: UIImage {
        switch self {
        case .jin:
            return UIImage(named: "jin")!
        }
    }
}

extension UIImage {
    
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
