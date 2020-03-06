//
//  ConstantsForApp.swift
//  2come1
//
//  Created by MacBook on 3/2/20.
//

import Foundation
import UIKit

enum CustomNotificationName {
    case getCurrentLocation
    
    var value: String{
        switch self {
        case .getCurrentLocation:
            return "CurrentLocationNotification"
        }
    }
}
