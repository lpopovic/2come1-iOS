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

