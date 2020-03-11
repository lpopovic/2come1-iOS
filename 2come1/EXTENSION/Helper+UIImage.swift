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
enum NavigationBarIcon {
    case
    back,
    more
    
    var value: UIImage {
        switch self {
        case .back:
            return UIImage(named: "icon-back")!
        case .more:
            return UIImage(named: "icon-more")!
        
        }
    }
}

enum customImages {
    case
    jin,
    userAvatar,
    message
    
    var value: UIImage {
        switch self {
        case .jin:
            return UIImage(named: "jin")!
        case .userAvatar:
            return UIImage(named: "user-avatar")!
        case .message:
            return UIImage(named: "icon-message")!
        }
    }
}

enum testImages {
    case
    test1
    
    var value: UIImage {
        switch self {
        case .test1:
            return UIImage(named: "TestImage1")!
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
