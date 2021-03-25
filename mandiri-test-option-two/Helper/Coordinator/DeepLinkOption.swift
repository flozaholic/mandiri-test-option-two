//
//  DeepLinkOption.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation

struct DeepLinkURLConstants {
    static let test = "TEST"
}

enum DeepLinkOption: String {
    
    case test = "TEST"
    
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["messageType"] as? String else { return nil }
        
        switch id {
        case DeepLinkURLConstants.test: return .test
        default: return nil
        }
    }
}
