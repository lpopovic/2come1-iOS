//
//  Helper+UIColor.swift
//  2come1
//
//  Created by MacBook on 3/3/20.
//

import Foundation
import UIKit

extension UIColor {
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
enum BaseColor {
    case
    black,
    gold,
    white
    
    var value: UIColor {
        switch self {
        case .black:
            return UIColor.hexStringToUIColor(hex: "#000000")
        case .gold:
            return UIColor.hexStringToUIColor(hex: "#FFDF00")
        case .white:
            return UIColor.hexStringToUIColor(hex: "#FFFFFF")
        }
    }
}
