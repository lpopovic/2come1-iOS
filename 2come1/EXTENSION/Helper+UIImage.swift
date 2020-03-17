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
    message,
    yinYang,
    send
    
    var value: UIImage {
        switch self {
        case .jin:
            return UIImage(named: "jin")!
        case .userAvatar:
            return UIImage(named: "user-avatar")!
        case .message:
            return UIImage(named: "icon-message")!
        case .yinYang:
            return UIImage(named: "icon_yinYang")!
        case .send:
            return UIImage(named: "icon-send")!
        }
    }
}

enum testImages {
    case
    test1,
    test2,
    test3
    
    var value: UIImage {
        switch self {
        case .test1:
            return UIImage(named: "TestImage1")!
        case .test2:
            return UIImage(named: "TestImage2")!
        case .test3:
            return UIImage(named: "TestImage3")!
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
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
