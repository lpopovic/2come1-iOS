//
//  ConstantsRestAPI.swift
//  2come1
//
//  Created by MacBook on 3/2/20.
//

import Foundation
// MARK: REST API CALL URL CLASS
class RestApi {
    class var sharedInstance: RestApi {
        struct Singleton {
            static let instance = RestApi()
        }
        return Singleton.instance
    }
    
    init() {
        GENRE_PATH = "base"
    }
    
    let GENRE_PATH: String
    
    var TEST_PATH: String {
        get {
            return "\(GENRE_PATH)test"
        }
    }
}
