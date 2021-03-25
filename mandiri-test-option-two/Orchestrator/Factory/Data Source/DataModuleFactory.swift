//
//  DataModuleFactory.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol DataModuleFactory {
    // MARK: - HTTP Client
    func makeBaseIdentifier() -> HTTPIdentifier
    func makeHTTPClient() -> HTTPClient
    
    // MARK: - API
    func makeSourceAPI() -> SourceAPI
    func makeHeadlineAPI() -> HeadlineAPI
}
