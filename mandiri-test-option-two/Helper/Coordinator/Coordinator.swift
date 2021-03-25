//
//  Coordinator.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
