//
//  NSObject+Extensions.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
